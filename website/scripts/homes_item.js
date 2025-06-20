function generate_home_relative_url(home_id) {
 return "/home?id=" + home_id;
}

function home_onclick(home_id) {
 window.location.href = generate_home_relative_url(home_id);
}