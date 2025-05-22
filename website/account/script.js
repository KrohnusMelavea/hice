function logout() {
 const xhr = new XMLHttpRequest();
 xhr.open("POST", "/endpoints/logout.php");
 xhr.onload = () => window.location.href = "/";
 xhr.send();
}