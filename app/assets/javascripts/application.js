// app/javascript/packs/application.js

import Rails from "@rails/ujs";
Rails.start();

// Your other JavaScript code...

// Add event listener for the logout link
document.addEventListener("DOMContentLoaded", function() {
  const logoutLink = document.querySelector('a[href="/users/sign_out"]');
  if (logoutLink) {
    logoutLink.addEventListener('click', function(event) {
      console.log('Logout link clicked');
      // Optionally prevent the default action for testing
      // event.preventDefault();
    });
  }
});
