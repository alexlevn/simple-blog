var express = require('express');
var router = express.Router();

var user_md = require("../models/user");
var post_md = require("../models/post");

var helper = require('../helpers/helper');

// The pages dont need signin before.
router.get('/signup', function (req, res) {
    res.render("signup", { data: {} });
})
router.get('/signin', function (req, res) {
    res.render("signin", { data: {} });
});

// The pages need signin before.
router.get('/', function (req, res) {
    if (req.session.user) {
        var data = post_md.getAllPosts();
        data.then(function (posts) {
            var data = {
                posts: posts,
                error: false
            }
            res.render('admin/dashboard', { data: data });
        }).catch(function (err) {
            res.render('admin/dashboard', { data: { error: "Get post get error: " + error } });
        })
    } else {
        res.redirect("/admin/signin")
    }
})

router.get('/user', function (req, res) {

    // This code is for CHECKING SIGNIN
    if (req.session.user) {
        if (req.session.user) {
            var data = user_md.getAllUsers();
    
            data.then(function (users) {
                var data = {
                    users: users,
                    error: false
                }
                res.render('admin/user', { data: data });
            })
                .catch(function (err) {
                    res.render('admin/user', { data: { error: "Can not get users list." } });
                })
    
        } else {
            res.redirect("/admin/signin")
        }
    } else {
        res.redirect("/admin/signin")
    }
})

router.get('/post/edit/:id', function (req, res) {
    // This code is for CHECKING SIGNIN
    if (req.session.user) {
        if (req.session.user) {
            var params = req.params;
            var id = params.id;
            var data = post_md.getPostById(id);
        
            data.then(function (posts) {
                var post = posts[0];
                // console.log("Post:" + post);
                var data = {
                    post: post,
                    error: false
                };
                res.render('admin/post/edit', { data: data });
            })
                .catch(function (err) {
                    res.render('admin/post/edit', { data: { error: "Could not get post by ID!" } })
                })
        } else {
            res.redirect("/admin/signin")
        }
    } else {
        res.redirect("/admin/signin")
    }
});


// Những trang dưới đây không cần sign?

router.get("/post/new", function (req, res) {
    // This code is for CHECKING SIGNIN
    if (req.session.user) {
        res.render('admin/post/new', { data: { error: false } });        
    } else {
        res.redirect("/admin/signin")
    }
});

// Nhung trang post co can kiem tra session khong? Can gui token giong nhu 
// Jobigo.vn (?)

// Đã kiểm tra login theo cách ở trên => ko được, vì nó không gửi session đi.
// console.log("Call delete, but the action's not yet active.");
// if (req.session.user) {
//     console.log("Call delete, and the action is ongoing.");        
// ...
router.delete('/post/delete', function (req, res) {
    var post_id = req.body.id;

    var data = post_md.deletePost(post_id);

    if (data) {
        data.then(function (result) {
            res.json({ status_code: 200 });
        })
            .catch(function (err) {
                res.json({ status_code: 500 });
            })
    } else {
        res.json({ status_code: 500 });
    }    
})

router.put('/post/edit', function (req, res) {
    var params = req.body;


    data = post_md.updatePost(params);

    // console.log("params: " + params);
    // console.log("Ajax is called here!!!");
    // console.log("params: " + JSON.stringify(params));
    // console.log('author:' + params.author);

    if (data) {
        data.then(function (result) {

            res.json({ status_code: 200 });
        })
            .catch(function (err) {
                res.json({ status_code: 500 });
            })
    } else {
        res.json({ status_code: 500 });
    }
});

router.post("/post/new", function (req, res) {
    // res.json({"message":"success"});
    var params = req.body;

    // Validate
    // console.log("Title: " + params.title.trim() + "end + length = " + params.title.trim().length);
    if (params.title.trim().length != 0) {
        var now = new Date();
        params.created_at = now;
        params.updated_at = now;

        var data = post_md.addPost(params);
        data.then(function (result) {
            res.redirect("/admin");
        })
            .catch(function (err) {
                res.render('admin/post/new', { data: { error: "Could not insert data" + err } });
            });
    } else {
        res.render('admin/post/new', { data: { error: "Please input title." } });
    }
});


router.post("/signin", function (req, res) {
    var params = req.body;

    // Validate
    if (params.email.trim().length == 0) {
        res.render('signin', { data: { error: "Please input email..!" } })
    } else {
        var data = user_md.getUserByEmail(params.email);
        data.then(function (users) {

            // console.log("User: " + users);

            var user = users[0];
            // console.log("User get from DB: " + JSON.stringify(user));
            if (user === undefined) {
                // console.log("User is not exist. ");    
                res.render('signin', { data: { error: "User is not exists!" } });
            }

            var status = helper.compare_password(params.password, user.password);
            console.log("finish compare: " + status);
            if (status) {
                req.session.user = user;
                console.log("Logined by user:" + JSON.stringify(user));
                res.redirect('/admin');
            } else {
                res.render('signin', { data: { error: "Wrong password!" } });
            }

        })
            .catch(function (err) {
                res.render('signin', { data: { error: "Get error: " + error } });
            });
    }
})

router.post("/signup", function (req, res) {
    var user = req.body;
    if (user.email.trim().length == 0) {
        res.render('signup', { data: { error: "Email is required" } });
    } else if (user.password.length == 0) {
        res.render('signup', { data: { error: "Password is required" } });
    } else if (user.password != user.repassword) {
        res.render('signup', { data: { error: "Password does not match" } });
    } else {

        // Insert to DB
        var password = helper.hash_password(user.password);
        user = {
            email: user.email,
            password: password,
            first_name: user.firstname,
            last_name: user.lastname
        };
        var result = user_md.addUser(user);

        result.then(function (data) {
            res.redirect('/admin/signin');
        }).catch(function (err) {
            res.render("signup", { data: { error: "Could not insert user to DB: " + err } });
        });
    }
})

module.exports = router;