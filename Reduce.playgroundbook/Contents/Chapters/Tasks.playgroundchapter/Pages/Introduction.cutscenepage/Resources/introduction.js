$(document).ready(function() {
  $('#fullpage').fullpage();
});

console.log = function(value) {
  $('#log').append(value);
}

console.error = function(value) {
  $('#log').append(value);
}
