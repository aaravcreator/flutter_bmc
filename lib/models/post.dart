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
}

List<Post> getPosts(){
  List<Post> myPosts = [
  Post(
      name: "John Doe",
      username: "@johndoe",
      avatar: "https://example.com/avatar1.png",
      likesCount: 15,
      postImage: "https://example.com/post_image1.png",
      commentsCount: 7,
    ),
     Post(
      name: "Jane Smith",
      username: "@janesmith",
      avatar: "https://example.com/avatar2.png",
      likesCount: 30,
      postImage: "https://example.com/post_image2.png",
      commentsCount: 12,
    ),
    Post(
      name: "Michael Johnson",
      username: "@michaeljohnson",
      avatar: "https://example.com/avatar3.png",
      likesCount: 20,
      postImage: null,
      commentsCount: 5,
    ),
    Post(
      name: "Emily Brown",
      username: "@emilybrown",
      avatar: "https://example.com/avatar4.png",
      likesCount: 8,
      postImage: "https://example.com/post_image3.png",
      commentsCount: 3,
    ),
    Post(
      name: "David Wilson",
      username: "@davidwilson",
      avatar: "https://example.com/avatar5.png",
      likesCount: 25,
      postImage: "https://example.com/post_image4.png",
      commentsCount: 10,
    )];
  return myPosts; 
}