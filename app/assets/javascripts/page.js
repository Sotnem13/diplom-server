
$(document).ready(function () {


    $('.image_preview').on('click',function () {

        console.log(this.src);
        $('.modal-content .image').css('background-image', 'url(' + this.src +  ')');
    });

});