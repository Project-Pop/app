// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:chopper/chopper.dart';

// Project imports:
import 'package:app/ConfigReader/config_reader.dart';
import 'package:app/Models/index.dart';
import 'Converters/built_value_converter.dart';
import 'Interceptors/auth_interceptor.dart';
import 'Interceptors/connectivity_interceptor.dart';

part 'post_api_service.chopper.dart';

@ChopperApi()
abstract class PostApiService extends ChopperService {
  //

  // TODO: sync this api
  // @Get(path: "/")
  // Future<Response> getGlobalFeed();

  @Post(path: '/')
  @Multipart()
  Future<Response<NewPostModel>> createPost({
    @required @Body() NewPostModel newPostModel,
    @required @Part() File image,
    @required @Part() File miniImage,
  });

  @Get(path: '/home')
  Future<Response<List<FeedItem>>> getHomeFeed();

  @Get(path: '/users/{username}')
  Future<Response<List<PostModel>>> getUserPosts(@Path() String username);

  @Get(path: '/users/{username}/uploads')
  Future<Response<List<PostModel>>> getUserUploads(@Path() String username);

  @Get(path: '/{postId}')
  Future<Response<PostModel>> getPostDetails(@Path() String postId);

  @Patch(path: '/{postId}')
  Future<Response> editPost({
    @required @Path() String postId,
    @required @Body() EditPostModel editPostModel,
  });

  @Delete(path: '/{postId}')
  Future<Response> deletePost(@Path() String postId);

  @Post(path: '/{postId}/tags/{username}')
  Future<Response> tagApproval({
    @required @Path() String postId,
    @required @Path() String username,
    @required @Body() TagApprovalModel tagApproval,
  });

  @Delete(path: '/{postId}/tags/{username}')
  Future<Response> removeTagFromYourUpload({
    @required @Path() String postId,
    @required @Path() String username,
  });

  @Post(path: '/{postId}/reactions')
  Future<Response> reactOnPost({
    @required @Path() String postId,
    @required @Body() PostReactionModel postReactionModel,
  });

  @Get(path: '/{postId}/comments')
  Future<Response<List<CommentModel>>> getCommentsOnPost(@Path() String postId);

  @Post(path: '/{postId}/comments')
  Future<Response> commentOnPost({
    @required @Path() String postId,
    @required @Body() PostCommentModel postCommentModel,
  });

  @Patch(path: '/{postId}/comments/{commentId}')
  Future<Response> editComment({
    @required @Path() String postId,
    @required @Path() String commentId,
    @required @Body() PostCommentModel postCommentModel,
  });

  @Delete(path: '/{postId}/comments/{commentId}')
  Future<Response> deleteComment({
    @required @Path() String postId,
    @required @Path() String commentId,
  });

  @Post(path: '/{postId}/comments/{commentId}/like')
  Future<Response> likeComment({
    @required @Path() String postId,
    @required @Path() String commentId,
  });

  @Post(path: '/{postId}/comments/{commentId}/unlike')
  Future<Response> unLikeComment({
    @required @Path() String postId,
    @required @Path() String commentId,
  });

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: ConfigReader.apiPostServiceUrl,
      services: [
        _$PostApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        ConnectivityInterceptor(),
        AuthInterceptor(),
        HttpLoggingInterceptor(),
      ],
    );
    return _$PostApiService(client);
  }
}
