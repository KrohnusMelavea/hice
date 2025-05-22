function generate_house_listings_relative_url(search_text) {
 return "/houses?search=" + search_text;
}

function search_button_onclick() {
 const search_text = document
  .getElementById("search-input")
  .value;
 window.location.href = generate_house_listings_relative_url(search_text);
}