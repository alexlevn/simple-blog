function Post() {
    function bindEvent() {
        $(".post_edit").click(function (e) {
            var params = {
                id: $(".id").val(),
                title: $(".title").val(),
                content: tinymce.get('content').getContent(),
                author: $('.author').val()
            };

            // alert(params.id + " - " + params.author);

            var base_url = location.protocol + '//' + document.domain + ":" + location.port;

            $.ajax({
                url: base_url + "/admin/post/edit",
                type: 'PUT',
                data: params,
                success: function (res) {
                    if(res && res.status_code == 200){
                        location.reload();
                    }
                }
            })
        });

        $(".post_delete").click(function(e){
            var post_id = $(this).attr('post_id');
            var base_url = location.protocol + '//' + document.domain + ":" + location.port;

            $.ajax({
                url: base_url + "/admin/post/delete",
                type: 'DELETE',
                data: {id: post_id},
                success: function (res) {
                    // alert("Delete - " + post_id);                    
                    if(res && res.status_code == 200){
                        location.reload();
                        // alert("200 success ");                                        
                    }
                }
            })
        })
    };


    bindEvent();

}

$(document).ready(function () {
    // console.log("Hello World ---!");
    new Post();
});
