var express = require('express');
var router = express.Router();

var post_md = require('../models/post');

router.get('/', function(req,res){
    var data = post_md.getAllPosts();
    data.then(function(posts){
        var data = {
            posts: posts,
            error: false
        };
        // console.log(JSON.stringify(posts));
        res.render('blog/index', {data:data});
    })
    .catch(function(err){   
        res.render('blog/index', {data:{error:"Could not get posts!"}});
    })
})

router.get('/post/:id', function(req,res){
    // console.log('Get post: ');
    var data = post_md.getPostById(req.params.id);
    data.then(function(posts){
        var post = posts[0];
        data = {
            post: post,
            error: false
        }
        res.render('blog/post', {data: data});
    }).catch(function(err){
        res.render('blog/post', {data: {error:"Could not get Post by Id!"}});
    })
})

router.get('/about', function(req,res){
    res.render('blog/about');
})

module.exports = router;