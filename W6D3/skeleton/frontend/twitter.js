//require all necessary files

const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search');

$(function () {
  $('.users-search').each( (i, search) => new UsersSearch(search) );
  $('button.follow-toggle').each( (i, btn) => new FollowToggle(btn, {}) );
});