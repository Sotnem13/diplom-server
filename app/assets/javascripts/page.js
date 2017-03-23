
$(document).ready(function () {


    $('.image_preview').on('click',function () {
        $('#video').hide();
        $('.modal-content .image').show()
        $('.modal-content .image').css('background-image', 'url(' + this.src +  ')');
    });

    $('.video_preview').on('click',function () {
        $('#video')[0].src = this.src;
        $('#video').show();

        $('.modal-content .image').hide();
    });

});