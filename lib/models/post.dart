class Post{
  String? name;
  String? username;
  String? avatar;
  int? likesCount;
  String? postImage;
  int? commentsCount;


  Post({
    this.name,this.username,this.avatar,this.likesCount,this.postImage,this.commentsCount
  }); 

  factory Post.fromJson(Map<String,dynamic> json)=>Post(
      name:json['name'],
      username:json["username"],
      avatar:json["avatar"]?? "",
      likesCount: json['likes_count'],
      postImage : json['post_image'],
      commentsCount: json['comments_count']
  );
}

List<Post> getPosts(){
  List<Post> myPosts = [
  Post(
      name: "Aarav Poudel",
      username: "@aaravpaudel1",
      avatar: "https://scontent.fktm18-1.fna.fbcdn.net/v/t39.30808-6/314502598_2804855852980228_7410136815488669753_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gfYMUUr4qGEAX_6NBIJ&_nc_ht=scontent.fktm18-1.fna&oh=00_AfCN3D5hFYmjdSMxxg1DVSa5AvJI8KXIN9-IZ_z62BF3Tg&oe=64C7D48D",
      likesCount: 15,
      postImage: "https://pbs.twimg.com/media/ECfs_66VAAAIKfp?format=jpg&name=medium",   // change to actual url
      commentsCount: 7,
    ),
     Post(
      name: "Jane Smith",
      username: "@janesmith",
      avatar: "https://reqres.in/img/faces/8-image.jpg",
      likesCount: 30,
      postImage: "https://pbs.twimg.com/media/ECfs_66VAAAIKfp?format=jpg&name=medium",
      commentsCount: 12,
    ),
    Post(
      name: "Michael Johnson",
      username: "@michaeljohnson",
      avatar: "https://reqres.in/img/faces/9-image.jpg",
      likesCount: 20,
      postImage: 'https://pbs.twimg.com/media/ECfs_66VAAAIKfp?format=jpg&name=medium',
      commentsCount: 5,
    ),
    Post(
      name: "Emily Brown",
      username: "@emilybrown",
      avatar: "https://reqres.in/img/faces/10-image.jpg",
      likesCount: 8,
      postImage: "https://pbs.twimg.com/media/ECfs_66VAAAIKfp?format=jpg&name=medium",
      commentsCount: 3,
    ),
    Post(
      name: "David Wilson",
      username: "@davidwilson",
      avatar: "https://reqres.in/img/faces/11-image.jpg",
      likesCount: 25,
      postImage: "https://pbs.twimg.com/media/ECfs_66VAAAIKfp?format=jpg&name=medium",
      commentsCount: 10,
    )];
  return myPosts; 
}