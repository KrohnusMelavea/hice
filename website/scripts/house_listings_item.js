function generate_house_listing_relative_url(house_listing_id) {
 return "/house?id=" + house_listing_id;
}

function house_listing_onclick(house_listing_id) {
 window.location.href = generate_house_listing_relative_url(house_listing_id);
}