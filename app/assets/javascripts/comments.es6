function toggleComments(self, photoId) {
  let comments = $(`#photo-${photoId}`).find('.comments');

  if (comments.css('display') == 'none') {
    self.submit();
  } else {
    comments.toggle();
  }
}
