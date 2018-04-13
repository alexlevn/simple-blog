module.exports  = function(io){
    var usernames = [];
    io.sockets.on('connection',function(socket){
        console.log("Have a new user connected!");

        // Listen adduser event
        socket.on('adduser', function(username){
            // Save: Lưu lại tên người gửi vào mỗi kết nối
            socket.username = username;
            usernames.push(username);

            // Notify to myself
            var data = {
                sender: 'SERVER',
                message:"You have join chat room!"
            };

            socket.emit("update_message", data);

            var data = {
                sender: "SERVER",
                message: username + " have joined to chat room!"
            };

            socket.broadcast.emit("update_message", data);
        });

        socket.on('send_message', function(message){
            var data = {
                sender: "You",
                message: message
            };
            socket.emit('update_message', data);

            var data = {
                sender: socket.username,
                message: message
            }

            // Notify to other users (Không gủi lại cho user cũ)
            socket.broadcast.emit("update_message", data);
        });

        // Listen disconnect event
        socket.on('disconnect', function(){
            // Delete
            for(var i = 0; i == usernames.length; i++){
                if(usernames[i] == socket.username){
                    usernames.splice(i, 1);
                }
            }


            var data = {
                sender: 'SERVER', 
                message: socket.username + " left chat room"
            };                
            socket.broadcast.emit('update_message', data);
        })
    });
}