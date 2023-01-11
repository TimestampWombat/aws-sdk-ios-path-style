//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSKinesisVideoResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKinesisVideoResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKinesisVideoResources

+ (instancetype)sharedInstance {
    static AWSKinesisVideoResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKinesisVideoResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-09-30\",\
    \"endpointPrefix\":\"kinesisvideo\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Kinesis Video\",\
    \"serviceFullName\":\"Amazon Kinesis Video Streams\",\
    \"serviceId\":\"Kinesis Video\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"kinesisvideo-2017-09-30\"\
  },\
  \"operations\":{\
    \"CreateSignalingChannel\":{\
      \"name\":\"CreateSignalingChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/createSignalingChannel\"\
      },\
      \"input\":{\"shape\":\"CreateSignalingChannelInput\"},\
      \"output\":{\"shape\":\"CreateSignalingChannelOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"AccountChannelLimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"TagsPerResourceExceededLimitException\"}\
      ],\
      \"documentation\":\"<p>Creates a signaling channel. </p> <p> <code>CreateSignalingChannel</code> is an asynchronous operation.</p>\"\
    },\
    \"CreateStream\":{\
      \"name\":\"CreateStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/createStream\"\
      },\
      \"input\":{\"shape\":\"CreateStreamInput\"},\
      \"output\":{\"shape\":\"CreateStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"AccountStreamLimitExceededException\"},\
        {\"shape\":\"DeviceStreamLimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidDeviceException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"TagsPerResourceExceededLimitException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Kinesis video stream. </p> <p>When you create a new stream, Kinesis Video Streams assigns it a version number. When you change the stream's metadata, Kinesis Video Streams updates the version. </p> <p> <code>CreateStream</code> is an asynchronous operation.</p> <p>For information about how the service works, see <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/how-it-works.html\\\">How it Works</a>. </p> <p>You must have permissions for the <code>KinesisVideo:CreateStream</code> action.</p>\"\
    },\
    \"DeleteSignalingChannel\":{\
      \"name\":\"DeleteSignalingChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/deleteSignalingChannel\"\
      },\
      \"input\":{\"shape\":\"DeleteSignalingChannelInput\"},\
      \"output\":{\"shape\":\"DeleteSignalingChannelOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"VersionMismatchException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes a specified signaling channel. <code>DeleteSignalingChannel</code> is an asynchronous operation. If you don't specify the channel's current version, the most recent version is deleted.</p>\"\
    },\
    \"DeleteStream\":{\
      \"name\":\"DeleteStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/deleteStream\"\
      },\
      \"input\":{\"shape\":\"DeleteStreamInput\"},\
      \"output\":{\"shape\":\"DeleteStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"VersionMismatchException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Kinesis video stream and the data contained in the stream. </p> <p>This method marks the stream for deletion, and makes the data in the stream inaccessible immediately.</p> <p> </p> <p> To ensure that you have the latest version of the stream before deleting it, you can specify the stream version. Kinesis Video Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a new version number. To get the latest stream version, use the <code>DescribeStream</code> API. </p> <p>This operation requires permission for the <code>KinesisVideo:DeleteStream</code> action.</p>\"\
    },\
    \"DescribeImageGenerationConfiguration\":{\
      \"name\":\"DescribeImageGenerationConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/describeImageGenerationConfiguration\"\
      },\
      \"input\":{\"shape\":\"DescribeImageGenerationConfigurationInput\"},\
      \"output\":{\"shape\":\"DescribeImageGenerationConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Gets the <code>ImageGenerationConfiguration</code> for a given Kinesis video stream.</p>\"\
    },\
    \"DescribeNotificationConfiguration\":{\
      \"name\":\"DescribeNotificationConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/describeNotificationConfiguration\"\
      },\
      \"input\":{\"shape\":\"DescribeNotificationConfigurationInput\"},\
      \"output\":{\"shape\":\"DescribeNotificationConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Gets the <code>NotificationConfiguration</code> for a given Kinesis video stream.</p>\"\
    },\
    \"DescribeSignalingChannel\":{\
      \"name\":\"DescribeSignalingChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/describeSignalingChannel\"\
      },\
      \"input\":{\"shape\":\"DescribeSignalingChannelInput\"},\
      \"output\":{\"shape\":\"DescribeSignalingChannelOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Returns the most current information about the signaling channel. You must specify either the name or the Amazon Resource Name (ARN) of the channel that you want to describe.</p>\"\
    },\
    \"DescribeStream\":{\
      \"name\":\"DescribeStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/describeStream\"\
      },\
      \"input\":{\"shape\":\"DescribeStreamInput\"},\
      \"output\":{\"shape\":\"DescribeStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Returns the most current information about the specified stream. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>\"\
    },\
    \"GetDataEndpoint\":{\
      \"name\":\"GetDataEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getDataEndpoint\"\
      },\
      \"input\":{\"shape\":\"GetDataEndpointInput\"},\
      \"output\":{\"shape\":\"GetDataEndpointOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets an endpoint for a specified stream for either reading or writing. Use this endpoint in your application to read from the specified stream (using the <code>GetMedia</code> or <code>GetMediaForFragmentList</code> operations) or write to it (using the <code>PutMedia</code> operation). </p> <note> <p>The returned endpoint does not have the API name appended. The client needs to add the API name to the returned endpoint.</p> </note> <p>In the request, specify the stream either by <code>StreamName</code> or <code>StreamARN</code>.</p>\"\
    },\
    \"GetSignalingChannelEndpoint\":{\
      \"name\":\"GetSignalingChannelEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getSignalingChannelEndpoint\"\
      },\
      \"input\":{\"shape\":\"GetSignalingChannelEndpointInput\"},\
      \"output\":{\"shape\":\"GetSignalingChannelEndpointOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Provides an endpoint for the specified signaling channel to send and receive messages. This API uses the <code>SingleMasterChannelEndpointConfiguration</code> input parameter, which consists of the <code>Protocols</code> and <code>Role</code> properties.</p> <p> <code>Protocols</code> is used to determine the communication mechanism. For example, if you specify <code>WSS</code> as the protocol, this API produces a secure websocket endpoint. If you specify <code>HTTPS</code> as the protocol, this API generates an HTTPS endpoint. </p> <p> <code>Role</code> determines the messaging permissions. A <code>MASTER</code> role results in this API generating an endpoint that a client can use to communicate with any of the viewers on the channel. A <code>VIEWER</code> role results in this API generating an endpoint that a client can use to communicate only with a <code>MASTER</code>. </p>\"\
    },\
    \"ListSignalingChannels\":{\
      \"name\":\"ListSignalingChannels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listSignalingChannels\"\
      },\
      \"input\":{\"shape\":\"ListSignalingChannelsInput\"},\
      \"output\":{\"shape\":\"ListSignalingChannelsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>ChannelInfo</code> objects. Each object describes a signaling channel. To retrieve only those channels that satisfy a specific condition, you can specify a <code>ChannelNameCondition</code>.</p>\"\
    },\
    \"ListStreams\":{\
      \"name\":\"ListStreams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listStreams\"\
      },\
      \"input\":{\"shape\":\"ListStreamsInput\"},\
      \"output\":{\"shape\":\"ListStreamsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>StreamInfo</code> objects. Each object describes a stream. To retrieve only streams that satisfy a specific condition, you can specify a <code>StreamNameCondition</code>. </p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/ListTagsForResource\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceInput\"},\
      \"output\":{\"shape\":\"ListTagsForResourceOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of tags associated with the specified signaling channel.</p>\"\
    },\
    \"ListTagsForStream\":{\
      \"name\":\"ListTagsForStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listTagsForStream\"\
      },\
      \"input\":{\"shape\":\"ListTagsForStreamInput\"},\
      \"output\":{\"shape\":\"ListTagsForStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidResourceFormatException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of tags associated with the specified stream.</p> <p>In the request, you must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/TagResource\"\
      },\
      \"input\":{\"shape\":\"TagResourceInput\"},\
      \"output\":{\"shape\":\"TagResourceOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"TagsPerResourceExceededLimitException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more tags to a signaling channel. A <i>tag</i> is a key-value pair (the value is optional) that you can define and assign to Amazon Web Services resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the <i>Billing and Cost Management and Cost Management User Guide</i>.</p>\"\
    },\
    \"TagStream\":{\
      \"name\":\"TagStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tagStream\"\
      },\
      \"input\":{\"shape\":\"TagStreamInput\"},\
      \"output\":{\"shape\":\"TagStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidResourceFormatException\"},\
        {\"shape\":\"TagsPerResourceExceededLimitException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more tags to a stream. A <i>tag</i> is a key-value pair (the value is optional) that you can define and assign to Amazon Web Services resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the <i>Billing and Cost Management and Cost Management User Guide</i>. </p> <p>You must provide either the <code>StreamName</code> or the <code>StreamARN</code>.</p> <p>This operation requires permission for the <code>KinesisVideo:TagStream</code> action.</p> <p>A Kinesis video stream can support up to 50 tags.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/UntagResource\"\
      },\
      \"input\":{\"shape\":\"UntagResourceInput\"},\
      \"output\":{\"shape\":\"UntagResourceOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from a signaling channel. In the request, specify only a tag key or keys; don't specify the value. If you specify a tag key that does not exist, it's ignored.</p>\"\
    },\
    \"UntagStream\":{\
      \"name\":\"UntagStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/untagStream\"\
      },\
      \"input\":{\"shape\":\"UntagStreamInput\"},\
      \"output\":{\"shape\":\"UntagStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidResourceFormatException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from a stream. In the request, specify only a tag key or keys; don't specify the value. If you specify a tag key that does not exist, it's ignored.</p> <p>In the request, you must provide the <code>StreamName</code> or <code>StreamARN</code>.</p>\"\
    },\
    \"UpdateDataRetention\":{\
      \"name\":\"UpdateDataRetention\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/updateDataRetention\"\
      },\
      \"input\":{\"shape\":\"UpdateDataRetentionInput\"},\
      \"output\":{\"shape\":\"UpdateDataRetentionOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"VersionMismatchException\"}\
      ],\
      \"documentation\":\"<p> Increases or decreases the stream's data retention period by the value that you specify. To indicate whether you want to increase or decrease the data retention period, specify the <code>Operation</code> parameter in the request body. In the request, you must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p> <note> <p>The retention period that you specify replaces the current value.</p> </note> <p>This operation requires permission for the <code>KinesisVideo:UpdateDataRetention</code> action.</p> <p>Changing the data retention period affects the data in the stream as follows:</p> <ul> <li> <p>If the data retention period is increased, existing data is retained for the new retention period. For example, if the data retention period is increased from one hour to seven hours, all existing data is retained for seven hours.</p> </li> <li> <p>If the data retention period is decreased, existing data is retained for the new retention period. For example, if the data retention period is decreased from seven hours to one hour, all existing data is retained for one hour, and any data older than one hour is deleted immediately.</p> </li> </ul>\"\
    },\
    \"UpdateImageGenerationConfiguration\":{\
      \"name\":\"UpdateImageGenerationConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/updateImageGenerationConfiguration\"\
      },\
      \"input\":{\"shape\":\"UpdateImageGenerationConfigurationInput\"},\
      \"output\":{\"shape\":\"UpdateImageGenerationConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"NoDataRetentionException\"}\
      ],\
      \"documentation\":\"<p>Updates the <code>StreamInfo</code> and <code>ImageProcessingConfiguration</code> fields.</p>\"\
    },\
    \"UpdateNotificationConfiguration\":{\
      \"name\":\"UpdateNotificationConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/updateNotificationConfiguration\"\
      },\
      \"input\":{\"shape\":\"UpdateNotificationConfigurationInput\"},\
      \"output\":{\"shape\":\"UpdateNotificationConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"NoDataRetentionException\"}\
      ],\
      \"documentation\":\"<p>Updates the notification information for a stream.</p>\"\
    },\
    \"UpdateSignalingChannel\":{\
      \"name\":\"UpdateSignalingChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/updateSignalingChannel\"\
      },\
      \"input\":{\"shape\":\"UpdateSignalingChannelInput\"},\
      \"output\":{\"shape\":\"UpdateSignalingChannelOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"VersionMismatchException\"}\
      ],\
      \"documentation\":\"<p>Updates the existing signaling channel. This is an asynchronous operation and takes time to complete. </p> <p>If the <code>MessageTtlSeconds</code> value is updated (either increased or reduced), it only applies to new messages sent via this channel after it's been updated. Existing messages are still expired as per the previous <code>MessageTtlSeconds</code> value.</p>\"\
    },\
    \"UpdateStream\":{\
      \"name\":\"UpdateStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/updateStream\"\
      },\
      \"input\":{\"shape\":\"UpdateStreamInput\"},\
      \"output\":{\"shape\":\"UpdateStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"VersionMismatchException\"}\
      ],\
      \"documentation\":\"<p>Updates stream metadata, such as the device name and media type.</p> <p>You must provide the stream name or the Amazon Resource Name (ARN) of the stream.</p> <p>To make sure that you have the latest version of the stream before updating it, you can specify the stream version. Kinesis Video Streams assigns a version to each stream. When you update a stream, Kinesis Video Streams assigns a new version number. To get the latest stream version, use the <code>DescribeStream</code> API. </p> <p> <code>UpdateStream</code> is an asynchronous operation, and takes time to complete.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"APIName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUT_MEDIA\",\
        \"GET_MEDIA\",\
        \"LIST_FRAGMENTS\",\
        \"GET_MEDIA_FOR_FRAGMENT_LIST\",\
        \"GET_HLS_STREAMING_SESSION_URL\",\
        \"GET_DASH_STREAMING_SESSION_URL\",\
        \"GET_CLIP\",\
        \"GET_IMAGES\"\
      ]\
    },\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You do not have required permissions to perform this operation.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"AccountChannelLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You have reached the maximum limit of active signaling channels for this Amazon Web Services account in this region.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"AccountStreamLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The number of streams created for the account is too high.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ChannelInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelName\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>The name of the signaling channel.</p>\"\
        },\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signaling channel.</p>\"\
        },\
        \"ChannelType\":{\
          \"shape\":\"ChannelType\",\
          \"documentation\":\"<p>The type of the signaling channel.</p>\"\
        },\
        \"ChannelStatus\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>Current status of the signaling channel.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the signaling channel was created.</p>\"\
        },\
        \"SingleMasterConfiguration\":{\
          \"shape\":\"SingleMasterConfiguration\",\
          \"documentation\":\"<p>A structure that contains the configuration for the <code>SINGLE_MASTER</code> channel type.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The current version of the signaling channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that encapsulates a signaling channel's metadata and properties.</p>\"\
    },\
    \"ChannelInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelInfo\"}\
    },\
    \"ChannelName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"ChannelNameCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ComparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>A comparison operator. Currently, you can only specify the <code>BEGINS_WITH</code> operator, which finds signaling channels whose names begin with a given prefix.</p>\"\
        },\
        \"ComparisonValue\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>A value to compare.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An optional input parameter for the <code>ListSignalingChannels</code> API. When this parameter is specified while invoking <code>ListSignalingChannels</code>, the API returns only the channels that satisfy a condition specified in <code>ChannelNameCondition</code>.</p>\"\
    },\
    \"ChannelProtocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"WSS\",\
        \"HTTPS\"\
      ]\
    },\
    \"ChannelRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MASTER\",\
        \"VIEWER\"\
      ]\
    },\
    \"ChannelType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SINGLE_MASTER\",\
        \"FULL_MESH\"\
      ]\
    },\
    \"ClientLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed client calls. Try making the call later.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ComparisonOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\"BEGINS_WITH\"]\
    },\
    \"ConfigurationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"CreateSignalingChannelInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelName\"],\
      \"members\":{\
        \"ChannelName\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>A name for the signaling channel that you are creating. It must be unique for each Amazon Web Services account and Amazon Web Services Region.</p>\"\
        },\
        \"ChannelType\":{\
          \"shape\":\"ChannelType\",\
          \"documentation\":\"<p>A type of the signaling channel that you are creating. Currently, <code>SINGLE_MASTER</code> is the only supported channel type. </p>\"\
        },\
        \"SingleMasterConfiguration\":{\
          \"shape\":\"SingleMasterConfiguration\",\
          \"documentation\":\"<p>A structure containing the configuration for the <code>SINGLE_MASTER</code> channel type. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagOnCreateList\",\
          \"documentation\":\"<p>A set of tags (key-value pairs) that you want to associate with this channel.</p>\"\
        }\
      }\
    },\
    \"CreateSignalingChannelOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the created channel.</p>\"\
        }\
      }\
    },\
    \"CreateStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamName\"],\
      \"members\":{\
        \"DeviceName\":{\
          \"shape\":\"DeviceName\",\
          \"documentation\":\"<p>The name of the device that is writing to the stream. </p> <note> <p>In the current implementation, Kinesis Video Streams does not use this name.</p> </note>\"\
        },\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>A name for the stream that you are creating.</p> <p>The stream name is an identifier for the stream, and must be unique for each account and region.</p>\"\
        },\
        \"MediaType\":{\
          \"shape\":\"MediaType\",\
          \"documentation\":\"<p>The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see <a href=\\\"http://www.iana.org/assignments/media-types/media-types.xhtml\\\">Media Types</a>. If you choose to specify the <code>MediaType</code>, see <a href=\\\"https://tools.ietf.org/html/rfc6838#section-4.2\\\">Naming Requirements</a> for guidelines.</p> <p>Example valid values include \\\"video/h264\\\" and \\\"video/h264,audio/aac\\\".</p> <p>This parameter is optional; the default value is <code>null</code> (or empty in JSON).</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The ID of the Key Management Service (KMS) key that you want Kinesis Video Streams to use to encrypt stream data.</p> <p>If no key ID is specified, the default, Kinesis Video-managed key (<code>aws/kinesisvideo</code>) is used.</p> <p> For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters\\\">DescribeKey</a>. </p>\"\
        },\
        \"DataRetentionInHours\":{\
          \"shape\":\"DataRetentionInHours\",\
          \"documentation\":\"<p>The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream.</p> <p>The default value is 0, indicating that the stream does not persist data.</p> <p>When the <code>DataRetentionInHours</code> value is 0, consumers can still consume the fragments that remain in the service host buffer, which has a retention time limit of 5 minutes and a retention memory limit of 200 MB. Fragments are removed from the buffer when either limit is reached.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"ResourceTags\",\
          \"documentation\":\"<p>A list of tags to associate with the specified stream. Each tag is a key-value pair (the value is optional).</p>\"\
        }\
      }\
    },\
    \"CreateStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream.</p>\"\
        }\
      }\
    },\
    \"DataEndpoint\":{\"type\":\"string\"},\
    \"DataRetentionChangeInHours\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"DataRetentionInHours\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"DeleteSignalingChannelInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelARN\"],\
      \"members\":{\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signaling channel that you want to delete.</p>\"\
        },\
        \"CurrentVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The current version of the signaling channel that you want to delete. You can obtain the current version by invoking the <code>DescribeSignalingChannel</code> or <code>ListSignalingChannels</code> API operations.</p>\"\
        }\
      }\
    },\
    \"DeleteSignalingChannelOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamARN\"],\
      \"members\":{\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream that you want to delete. </p>\"\
        },\
        \"CurrentVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Optional: The version of the stream that you want to delete. </p> <p>Specify the version as a safeguard to ensure that your are deleting the correct stream. To get the stream version, use the <code>DescribeStream</code> API.</p> <p>If not specified, only the <code>CreationTime</code> is checked before deleting the stream.</p>\"\
        }\
      }\
    },\
    \"DeleteStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeImageGenerationConfigurationInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to retrieve the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Kinesis video stream from which to retrieve the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeImageGenerationConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageGenerationConfiguration\":{\
          \"shape\":\"ImageGenerationConfiguration\",\
          \"documentation\":\"<p>The structure that contains the information required for the Kinesis video stream (KVS) images delivery. If this structure is null, the configuration will be deleted from the stream.</p>\"\
        }\
      }\
    },\
    \"DescribeNotificationConfigurationInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to retrieve the notification configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to retrieve the notification configuration. You must specify either the <code>StreamName</code> or the StreamARN.</p>\"\
        }\
      }\
    },\
    \"DescribeNotificationConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"documentation\":\"<p>The structure that contains the information required for notifications. If the structure is null, the configuration will be deleted from the stream.</p>\"\
        }\
      }\
    },\
    \"DescribeSignalingChannelInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelName\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>The name of the signaling channel that you want to describe.</p>\"\
        },\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The ARN of the signaling channel that you want to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeSignalingChannelOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelInfo\":{\
          \"shape\":\"ChannelInfo\",\
          \"documentation\":\"<p>A structure that encapsulates the specified signaling channel's metadata and properties.</p>\"\
        }\
      }\
    },\
    \"DescribeStreamInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream.</p>\"\
        }\
      }\
    },\
    \"DescribeStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamInfo\":{\
          \"shape\":\"StreamInfo\",\
          \"documentation\":\"<p>An object that describes the stream.</p>\"\
        }\
      }\
    },\
    \"DestinationRegion\":{\
      \"type\":\"string\",\
      \"max\":14,\
      \"min\":9,\
      \"pattern\":\"^[a-z]+(-[a-z]+)?-[a-z]+-[0-9]$\"\
    },\
    \"DestinationUri\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z_0-9]+:(//)?([^/]+)/?([^*]*)$\"\
    },\
    \"DeviceName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"DeviceStreamLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Not implemented. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"Format\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"JPEG\",\
        \"PNG\"\
      ]\
    },\
    \"FormatConfig\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"FormatConfigKey\"},\
      \"value\":{\"shape\":\"FormatConfigValue\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"FormatConfigKey\":{\
      \"type\":\"string\",\
      \"enum\":[\"JPEGQuality\"]\
    },\
    \"FormatConfigValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^[a-zA-Z_0-9]+\"\
    },\
    \"GetDataEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"APIName\"],\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream that you want to get the endpoint for. You must specify either this parameter or a <code>StreamARN</code> in the request.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream that you want to get the endpoint for. You must specify either this parameter or a <code>StreamName</code> in the request. </p>\"\
        },\
        \"APIName\":{\
          \"shape\":\"APIName\",\
          \"documentation\":\"<p>The name of the API action for which to get an endpoint.</p>\"\
        }\
      }\
    },\
    \"GetDataEndpointOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataEndpoint\":{\
          \"shape\":\"DataEndpoint\",\
          \"documentation\":\"<p>The endpoint value. To read data from the stream or to write data to it, specify this endpoint in your application.</p>\"\
        }\
      }\
    },\
    \"GetSignalingChannelEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelARN\"],\
      \"members\":{\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signalling channel for which you want to get an endpoint.</p>\"\
        },\
        \"SingleMasterChannelEndpointConfiguration\":{\
          \"shape\":\"SingleMasterChannelEndpointConfiguration\",\
          \"documentation\":\"<p>A structure containing the endpoint configuration for the <code>SINGLE_MASTER</code> channel type.</p>\"\
        }\
      }\
    },\
    \"GetSignalingChannelEndpointOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceEndpointList\":{\
          \"shape\":\"ResourceEndpointList\",\
          \"documentation\":\"<p>A list of endpoints for the specified signaling channel.</p>\"\
        }\
      }\
    },\
    \"HeightPixels\":{\
      \"type\":\"integer\",\
      \"max\":2160,\
      \"min\":1\
    },\
    \"ImageGenerationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Status\",\
        \"ImageSelectorType\",\
        \"DestinationConfig\",\
        \"SamplingInterval\",\
        \"Format\"\
      ],\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ConfigurationStatus\",\
          \"documentation\":\"<p>Indicates whether the <code>ContinuousImageGenerationConfigurations</code> API is enabled or disabled.</p>\"\
        },\
        \"ImageSelectorType\":{\
          \"shape\":\"ImageSelectorType\",\
          \"documentation\":\"<p>The origin of the Server or Producer timestamps to use to generate the images.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"ImageGenerationDestinationConfig\",\
          \"documentation\":\"<p>The structure that contains the information required to deliver images to a customer.</p>\"\
        },\
        \"SamplingInterval\":{\
          \"shape\":\"SamplingInterval\",\
          \"documentation\":\"<p>The time interval in milliseconds (ms) at which the images need to be generated from the stream. The minimum value that can be provided is 33 ms, because a camera that generates content at 30 FPS would create a frame every 33.3 ms. If the timestamp range is less than the sampling interval, the Image from the <code>StartTimestamp</code> will be returned if available. </p>\"\
        },\
        \"Format\":{\
          \"shape\":\"Format\",\
          \"documentation\":\"<p>The accepted image format.</p>\"\
        },\
        \"FormatConfig\":{\
          \"shape\":\"FormatConfig\",\
          \"documentation\":\"<p>The list of a key-value pair structure that contains extra parameters that can be applied when the image is generated. The <code>FormatConfig</code> key is the <code>JPEGQuality</code>, which indicates the JPEG quality key to be used to generate the image. The <code>FormatConfig</code> value accepts ints from 1 to 100. If the value is 1, the image will be generated with less quality and the best compression. If the value is 100, the image will be generated with the best quality and less compression. If no value is provided, the default value of the <code>JPEGQuality</code> key will be set to 80.</p>\"\
        },\
        \"WidthPixels\":{\
          \"shape\":\"WidthPixels\",\
          \"documentation\":\"<p>The width of the output image that is used in conjunction with the <code>HeightPixels</code> parameter. When both <code>WidthPixels</code> and <code>HeightPixels</code> parameters are provided, the image will be stretched to fit the specified aspect ratio. If only the <code>WidthPixels</code> parameter is provided, its original aspect ratio will be used to calculate the <code>HeightPixels</code> ratio. If neither parameter is provided, the original image size will be returned.</p>\"\
        },\
        \"HeightPixels\":{\
          \"shape\":\"HeightPixels\",\
          \"documentation\":\"<p>The height of the output image that is used in conjunction with the <code>WidthPixels</code> parameter. When both <code>HeightPixels</code> and <code>WidthPixels</code> parameters are provided, the image will be stretched to fit the specified aspect ratio. If only the <code>HeightPixels</code> parameter is provided, its original aspect ratio will be used to calculate the <code>WidthPixels</code> ratio. If neither parameter is provided, the original image size will be returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains the information required for the KVS images delivery. If null, the configuration will be deleted from the stream.</p>\"\
    },\
    \"ImageGenerationDestinationConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Uri\",\
        \"DestinationRegion\"\
      ],\
      \"members\":{\
        \"Uri\":{\
          \"shape\":\"DestinationUri\",\
          \"documentation\":\"<p>The Uniform Resource Idenifier (URI) that identifies where the images will be delivered.</p>\"\
        },\
        \"DestinationRegion\":{\
          \"shape\":\"DestinationRegion\",\
          \"documentation\":\"<p>The AWS Region of the S3 bucket where images will be delivered. This <code>DestinationRegion</code> must match the Region where the stream is located.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains the information required to deliver images to a customer.</p>\"\
    },\
    \"ImageSelectorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SERVER_TIMESTAMP\",\
        \"PRODUCER_TIMESTAMP\"\
      ]\
    },\
    \"InvalidArgumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The value for this input parameter is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidDeviceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Not implemented.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidResourceFormatException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The format of the <code>StreamARN</code> is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"ListOfProtocols\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelProtocol\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"ListSignalingChannelsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListStreamsInputLimit\",\
          \"documentation\":\"<p>The maximum number of channels to return in the response. The default is 500.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you specify this parameter, when the result of a <code>ListSignalingChannels</code> operation is truncated, the call returns the <code>NextToken</code> in the response. To get another batch of channels, provide this token in your next request.</p>\"\
        },\
        \"ChannelNameCondition\":{\
          \"shape\":\"ChannelNameCondition\",\
          \"documentation\":\"<p>Optional: Returns only the channels that satisfy a specific condition.</p>\"\
        }\
      }\
    },\
    \"ListSignalingChannelsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelInfoList\":{\
          \"shape\":\"ChannelInfoList\",\
          \"documentation\":\"<p>An array of <code>ChannelInfo</code> objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, the call returns this element with a token. To get the next batch of streams, use this token in your next request.</p>\"\
        }\
      }\
    },\
    \"ListStreamsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListStreamsInputLimit\",\
          \"documentation\":\"<p>The maximum number of streams to return in the response. The default is 10,000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you specify this parameter, when the result of a <code>ListStreams</code> operation is truncated, the call returns the <code>NextToken</code> in the response. To get another batch of streams, provide this token in your next request.</p>\"\
        },\
        \"StreamNameCondition\":{\
          \"shape\":\"StreamNameCondition\",\
          \"documentation\":\"<p>Optional: Returns only streams that satisfy a specific condition. Currently, you can specify only the prefix of a stream name as a condition. </p>\"\
        }\
      }\
    },\
    \"ListStreamsInputLimit\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"ListStreamsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamInfoList\":{\
          \"shape\":\"StreamInfoList\",\
          \"documentation\":\"<p>An array of <code>StreamInfo</code> objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, the call returns this element with a token. To get the next batch of streams, use this token in your next request. </p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you specify this parameter and the result of a <code>ListTagsForResource</code> call is truncated, the response includes a token that you can use in the next request to fetch the next batch of tags. </p>\"\
        },\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signaling channel for which you want to list tags.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you specify this parameter and the result of a <code>ListTagsForResource</code> call is truncated, the response includes a token that you can use in the next request to fetch the next set of tags. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"ResourceTags\",\
          \"documentation\":\"<p>A map of tag keys and values associated with the specified signaling channel.</p>\"\
        }\
      }\
    },\
    \"ListTagsForStreamInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you specify this parameter and the result of a <code>ListTagsForStream</code> call is truncated, the response includes a token that you can use in the next request to fetch the next batch of tags.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream that you want to list tags for.</p>\"\
        },\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream that you want to list tags for.</p>\"\
        }\
      }\
    },\
    \"ListTagsForStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you specify this parameter and the result of a <code>ListTags</code> call is truncated, the response includes a token that you can use in the next request to fetch the next set of tags.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"ResourceTags\",\
          \"documentation\":\"<p>A map of tag keys and values associated with the specified stream.</p>\"\
        }\
      }\
    },\
    \"MediaType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\-\\\\.\\\\+]+/[\\\\w\\\\-\\\\.\\\\+]+(,[\\\\w\\\\-\\\\.\\\\+]+/[\\\\w\\\\-\\\\.\\\\+]+)*\"\
    },\
    \"MessageTtlSeconds\":{\
      \"type\":\"integer\",\
      \"max\":120,\
      \"min\":5\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0,\
      \"pattern\":\"[a-zA-Z0-9+/=]*\"\
    },\
    \"NoDataRetentionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The Stream data retention in hours is equal to zero.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The caller is not authorized to perform this operation.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"NotificationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Status\",\
        \"DestinationConfig\"\
      ],\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ConfigurationStatus\",\
          \"documentation\":\"<p>Indicates if a notification configuration is enabled or disabled.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"NotificationDestinationConfig\",\
          \"documentation\":\"<p>The destination information required to deliver a notification to a customer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains the notification information for the KVS images delivery. If this parameter is null, the configuration will be deleted from the stream.</p>\"\
    },\
    \"NotificationDestinationConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Uri\"],\
      \"members\":{\
        \"Uri\":{\
          \"shape\":\"DestinationUri\",\
          \"documentation\":\"<p>The Uniform Resource Idenifier (URI) that identifies where the images will be delivered.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains the information required to deliver a notification to a customer.</p>\"\
    },\
    \"ResourceARN\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"arn:[a-z\\\\d-]+:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+\"\
    },\
    \"ResourceEndpoint\":{\"type\":\"string\"},\
    \"ResourceEndpointList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceEndpointListItem\"}\
    },\
    \"ResourceEndpointListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Protocol\":{\
          \"shape\":\"ChannelProtocol\",\
          \"documentation\":\"<p>The protocol of the signaling channel returned by the <code>GetSignalingChannelEndpoint</code> API.</p>\"\
        },\
        \"ResourceEndpoint\":{\
          \"shape\":\"ResourceEndpoint\",\
          \"documentation\":\"<p>The endpoint of the signaling channel returned by the <code>GetSignalingChannelEndpoint</code> API.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that describes the endpoint of the signaling channel returned by the <code>GetSignalingChannelEndpoint</code> API.</p>\"\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource is currently not available for this operation. New resources cannot be created with the same name as existing resources. Also, resources cannot be updated or deleted unless they are in an <code>ACTIVE</code> state.</p> <p>If this exception is returned, do not use it to determine whether the requested resource already exists. Instead, it is recommended you use the resource-specific describe API, for example, <code>DescribeStream</code> for video streams.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Amazon Kinesis Video Streams can't find the stream that you specified.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceTags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"SamplingInterval\":{\
      \"type\":\"integer\",\
      \"max\":20000,\
      \"min\":3000\
    },\
    \"SingleMasterChannelEndpointConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Protocols\":{\
          \"shape\":\"ListOfProtocols\",\
          \"documentation\":\"<p>This property is used to determine the nature of communication over this <code>SINGLE_MASTER</code> signaling channel. If <code>WSS</code> is specified, this API returns a websocket endpoint. If <code>HTTPS</code> is specified, this API returns an <code>HTTPS</code> endpoint.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"ChannelRole\",\
          \"documentation\":\"<p>This property is used to determine messaging permissions in this <code>SINGLE_MASTER</code> signaling channel. If <code>MASTER</code> is specified, this API returns an endpoint that a client can use to receive offers from and send answers to any of the viewers on this signaling channel. If <code>VIEWER</code> is specified, this API returns an endpoint that a client can use only to send offers to another <code>MASTER</code> client on this signaling channel. </p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains the endpoint configuration for the <code>SINGLE_MASTER</code> channel type. </p>\"\
    },\
    \"SingleMasterConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageTtlSeconds\":{\
          \"shape\":\"MessageTtlSeconds\",\
          \"documentation\":\"<p>The period of time a signaling channel retains undelivered messages before they are discarded.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains the configuration for the <code>SINGLE_MASTER</code> channel type.</p>\"\
    },\
    \"Status\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"ACTIVE\",\
        \"UPDATING\",\
        \"DELETING\"\
      ]\
    },\
    \"StreamInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceName\":{\
          \"shape\":\"DeviceName\",\
          \"documentation\":\"<p>The name of the device that is associated with the stream.</p>\"\
        },\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream.</p>\"\
        },\
        \"MediaType\":{\
          \"shape\":\"MediaType\",\
          \"documentation\":\"<p>The <code>MediaType</code> of the stream. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The ID of the Key Management Service (KMS) key that Kinesis Video Streams uses to encrypt data on the stream.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the stream.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>The status of the stream.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A time stamp that indicates when the stream was created.</p>\"\
        },\
        \"DataRetentionInHours\":{\
          \"shape\":\"DataRetentionInHours\",\
          \"documentation\":\"<p>How long the stream retains data, in hours.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object describing a Kinesis video stream.</p>\"\
    },\
    \"StreamInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StreamInfo\"}\
    },\
    \"StreamName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"StreamNameCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ComparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>A comparison operator. Currently, you can specify only the <code>BEGINS_WITH</code> operator, which finds streams whose names start with a given prefix.</p>\"\
        },\
        \"ComparisonValue\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>A value to compare.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the condition that streams must satisfy to be returned when you list streams (see the <code>ListStreams</code> API). A condition has a comparison operation and a value. Currently, you can specify only the <code>BEGINS_WITH</code> operator, which finds streams whose names start with a given prefix. </p>\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key of the tag that is associated with the specified signaling channel.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of the tag that is associated with the specified signaling channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A key and value pair that is associated with the specified signaling channel.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagOnCreateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signaling channel to which you want to add tags.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with the specified signaling channel. Each tag is a key-value pair.</p>\"\
        }\
      }\
    },\
    \"TagResourceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Tags\"],\
      \"members\":{\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to add the tag or tags to.</p>\"\
        },\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream that you want to add the tag or tags to.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"ResourceTags\",\
          \"documentation\":\"<p>A list of tags to associate with the specified stream. Each tag is a key-value pair (the value is optional).</p>\"\
        }\
      }\
    },\
    \"TagStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*\"\
    },\
    \"TagsPerResourceExceededLimitException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You have exceeded the limit of tags that you can associate with the resource. A Kinesis video stream can support up to 50 tags. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"UntagResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"TagKeyList\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signaling channel from which you want to remove tags.</p>\"\
        },\
        \"TagKeyList\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of the keys of the tags that you want to remove.</p>\"\
        }\
      }\
    },\
    \"UntagResourceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UntagStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TagKeyList\"],\
      \"members\":{\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream that you want to remove tags from.</p>\"\
        },\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream that you want to remove tags from.</p>\"\
        },\
        \"TagKeyList\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of the keys of the tags that you want to remove.</p>\"\
        }\
      }\
    },\
    \"UntagStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateDataRetentionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CurrentVersion\",\
        \"Operation\",\
        \"DataRetentionChangeInHours\"\
      ],\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream whose retention period you want to change.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream whose retention period you want to change.</p>\"\
        },\
        \"CurrentVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the stream whose retention period you want to change. To get the version, call either the <code>DescribeStream</code> or the <code>ListStreams</code> API.</p>\"\
        },\
        \"Operation\":{\
          \"shape\":\"UpdateDataRetentionOperation\",\
          \"documentation\":\"<p>Indicates whether you want to increase or decrease the retention period.</p>\"\
        },\
        \"DataRetentionChangeInHours\":{\
          \"shape\":\"DataRetentionChangeInHours\",\
          \"documentation\":\"<p>The retention period, in hours. The value you specify replaces the current value. The maximum value for this parameter is 87600 (ten years).</p>\"\
        }\
      }\
    },\
    \"UpdateDataRetentionOperation\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INCREASE_DATA_RETENTION\",\
        \"DECREASE_DATA_RETENTION\"\
      ]\
    },\
    \"UpdateDataRetentionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateImageGenerationConfigurationInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to update the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to update the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"ImageGenerationConfiguration\":{\
          \"shape\":\"ImageGenerationConfiguration\",\
          \"documentation\":\"<p>The structure that contains the information required for the KVS images delivery. If the structure is null, the configuration will be deleted from the stream.</p>\"\
        }\
      }\
    },\
    \"UpdateImageGenerationConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateNotificationConfigurationInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to update the notification configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to update the notification configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"documentation\":\"<p>The structure containing the information required for notifications. If the structure is null, the configuration will be deleted from the stream.</p>\"\
        }\
      }\
    },\
    \"UpdateNotificationConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateSignalingChannelInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelARN\",\
        \"CurrentVersion\"\
      ],\
      \"members\":{\
        \"ChannelARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the signaling channel that you want to update.</p>\"\
        },\
        \"CurrentVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The current version of the signaling channel that you want to update.</p>\"\
        },\
        \"SingleMasterConfiguration\":{\
          \"shape\":\"SingleMasterConfiguration\",\
          \"documentation\":\"<p>The structure containing the configuration for the <code>SINGLE_MASTER</code> type of the signaling channel that you want to update. </p>\"\
        }\
      }\
    },\
    \"UpdateSignalingChannelOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CurrentVersion\"],\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream whose metadata you want to update.</p> <p>The stream name is an identifier for the stream, and must be unique for each account and region.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The ARN of the stream whose metadata you want to update.</p>\"\
        },\
        \"CurrentVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the stream whose metadata you want to update.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"DeviceName\",\
          \"documentation\":\"<p>The name of the device that is writing to the stream. </p> <note> <p> In the current implementation, Kinesis Video Streams does not use this name. </p> </note>\"\
        },\
        \"MediaType\":{\
          \"shape\":\"MediaType\",\
          \"documentation\":\"<p>The stream's media type. Use <code>MediaType</code> to specify the type of content that the stream contains to the consumers of the stream. For more information about media types, see <a href=\\\"http://www.iana.org/assignments/media-types/media-types.xhtml\\\">Media Types</a>. If you choose to specify the <code>MediaType</code>, see <a href=\\\"https://tools.ietf.org/html/rfc6838#section-4.2\\\">Naming Requirements</a>.</p> <p>To play video on the console, you must specify the correct video type. For example, if the video in the stream is H.264, specify <code>video/h264</code> as the <code>MediaType</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Version\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9]+\"\
    },\
    \"VersionMismatchException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The stream version that you specified is not the latest version. To get the latest version, use the <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_DescribeStream.html\\\">DescribeStream</a> API.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"WidthPixels\":{\
      \"type\":\"integer\",\
      \"max\":3840,\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p/>\"\
}\
";
}

@end
