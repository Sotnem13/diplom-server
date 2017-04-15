
$(document).ready(function () {


    // var modal = $('.modal-content .image')

    $('.image_preview').on('click',function () {
        $('#video').hide();

        $('.modal-content .image').show();
        $('.modal-content .image').css('background-image', 'url(' + this.src +  ')');

        $('.modal-content .emoji').html( $(this).data('emoji') );


    });

    $('.video_preview').on('click',function () {
        $('#video')[0].src = this.src;
        $('#video').show();

        $('.modal-content .emoji').hide();
        $('.modal-content .image').hide();
    });

});