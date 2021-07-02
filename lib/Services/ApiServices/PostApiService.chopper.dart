// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostApiService;

  @override
  Future<Response<NewPostModel>> createPost(
      {NewPostModel newPostModel, File image, File miniImage}) {
    final $url = '/v1/posts/';
    final $body = newPostModel;
    final $parts = <PartValue>[
      PartValue<File>('image', image),
      PartValue<File>('miniImage', miniImage)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        body: $body, parts: $parts, multipart: true);
    return client.send<NewPostModel, NewPostModel>($request);
  }

  @override
  Future<Response<List<FeedItem>>> getHomeFeed() {
    final $url = '/v1/posts/home';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<FeedItem>, FeedItem>($request);
  }

  @override
  Future<Response<List<PostModel>>> getUserPosts(String username) {
    final $url = '/v1/posts/users/$username';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<PostModel>, PostModel>($request);
  }

  @override
  Future<Response<List<PostModel>>> getUserUploads(String username) {
    final $url = '/v1/posts/users/$username/uploads';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<PostModel>, PostModel>($request);
  }

  @override
  Future<Response<PostModel>> getPostDetails(String postId) {
    final $url = '/v1/posts/$postId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PostModel, PostModel>($request);
  }

  @override
  Future<Response<dynamic>> editPost(
      {String postId, EditPostModel editPostModel}) {
    final $url = '/v1/posts/$postId';
    final $body = editPostModel;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deletePost(String postId) {
    final $url = '/v1/posts/$postId';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> tagApproval(
      {String postId, String username, TagApprovalModel tagApproval}) {
    final $url = '/v1/posts/$postId/tags/$username';
    final $body = tagApproval;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> removeTagFromYourUpload(
      {String postId, String username}) {
    final $url = '/v1/posts/$postId/tags/$username';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> reactOnPost(
      {String postId, PostReactionModel postReactionModel}) {
    final $url = '/v1/posts/$postId/reactions';
    final $body = postReactionModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<CommentModel>>> getCommentsOnPost(String postId) {
    final $url = '/v1/posts/$postId/comments';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<CommentModel>, CommentModel>($request);
  }

  @override
  Future<Response<dynamic>> commentOnPost(
      {String postId, PostCommentModel postCommentModel}) {
    final $url = '/v1/posts/$postId/comments';
    final $body = postCommentModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editComment(
      {String postId, String commentId, PostCommentModel postCommentModel}) {
    final $url = '/v1/posts/$postId/comments/$commentId';
    final $body = postCommentModel;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteComment({String postId, String commentId}) {
    final $url = '/v1/posts/$postId/comments/$commentId';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> likeComment({String postId, String commentId}) {
    final $url = '/v1/posts/$postId/comments/$commentId/like';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> unLikeComment({String postId, String commentId}) {
    final $url = '/v1/posts/$postId/comments/$commentId/unlike';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
