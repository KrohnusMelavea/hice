function house_listing_purchase_onclick() {
 const url_parameters = new URLSearchParams(window.location.search);
 console.log(url_parameters.get("id"));
 const xhr = new XMLHttpRequest();
 xhr.onload = () => {
  const response = JSON.parse(xhr.responseText);
  console.log(response);
  switch (response.status) {
  case 0:
   window.location.href = `/home/?id=${response.property_sale_id}`;
   break;
  case 1:
   break;
  case 2:
   window.location.href = `/login`;
   break;
  default:
   break;
  }
 }
 xhr.open("POST", "/endpoints/purchase_listing.php");
 xhr.setRequestHeader("Content-Type", "application/json");
 const body = {
  "id": url_parameters.get("id")
 };
 xhr.send(JSON.stringify(body));
}