const APIUtil = {

  followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  changeFollowStatus: (id, myMethod) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: 'json',
      method: myMethod
    })
  ),

};

module.exports = APIUtil;
