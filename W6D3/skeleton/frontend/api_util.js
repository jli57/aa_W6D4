const APIUtil = {

  followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  changeFollowStatus: (id, myMethod) => (
    $.ajax({
      url: `/users/${id}/follow`,
      method: myMethod,
      dataType: 'json'
    })
  ),
  
  searchUsers: query => (
    $.ajax({
      url: '/users/search',
      dataType: 'json',
      method: 'GET',
      data: { query }
    })
  ),

};

module.exports = APIUtil;
