if (document.getElementById('user_avatar')) {
  document.getElementById('user_avatar').addEventListener('change',
  function readURL(input) {
    // debugger
    if (input.target.files && input.target.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $('#avatar')
                .attr('src', e.target.result)
                .width(100)
                .height(100)
                .show()
        };

        reader.readAsDataURL(input.target.files[0]);
            $('.coucou').hide()
    }
  }
);}
