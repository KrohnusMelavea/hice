function validate_registration() {
 const firstname = document.getElementById("registration-form-firstname-input").value.trim();
 const lastname  = document.getElementById("registration-form-lastname-input").value.trim();
 const username  = document.getElementById("registration-form-username-input").value.trim();
 const password  = document.getElementById("registration-form-password-input").value.trim();
 
 if (firstname.length === 0) {
  console.warn("Firstname Empty");
  return false;
 } else if (lastname.length === 0) {
  console.warn("Lastname Empty");
  return false;
 } else if (username.length === 0) {
  console.warn("Username Empty");
  return false;
 }

 const password_meets_policy = does_password_meet_policy(password);
 if (!password_meets_policy) {
  console.warn(`Password '${password}' did not meet policy.`);
 }
 
 return password_meets_policy;
}