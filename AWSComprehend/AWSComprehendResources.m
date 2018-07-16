//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSComprehendResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSComprehendResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSComprehendResources

+ (instancetype)sharedInstance {
    static AWSComprehendResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSComprehendResources new];
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
    \"apiVersion\":\"2017-11-27\",\
    \"endpointPrefix\":\"comprehend\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Comprehend\",\
    \"serviceId\":\"Comprehend\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"comprehend\",\
    \"targetPrefix\":\"Comprehend_20171127\",\
    \"uid\":\"comprehend-2017-11-27\"\
  },\
  \"operations\":{\
    \"BatchDetectDominantLanguage\":{\
      \"name\":\"BatchDetectDominantLanguage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectDominantLanguageRequest\"},\
      \"output\":{\"shape\":\"BatchDetectDominantLanguageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href=\\\"http://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html\\\">Amazon Comprehend Supported Languages</a>. </p>\"\
    },\
    \"BatchDetectEntities\":{\
      \"name\":\"BatchDetectEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectEntitiesRequest\"},\
      \"output\":{\"shape\":\"BatchDetectEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the text of a batch of documents and returns information about them. For more information about entities, see <a>how-entities</a> </p>\"\
    },\
    \"BatchDetectKeyPhrases\":{\
      \"name\":\"BatchDetectKeyPhrases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectKeyPhrasesRequest\"},\
      \"output\":{\"shape\":\"BatchDetectKeyPhrasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects the key noun phrases found in a batch of documents.</p>\"\
    },\
    \"BatchDetectSentiment\":{\
      \"name\":\"BatchDetectSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectSentimentRequest\"},\
      \"output\":{\"shape\":\"BatchDetectSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects a batch of documents and returns an inference of the prevailing sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.</p>\"\
    },\
    \"DescribeTopicsDetectionJob\":{\
      \"name\":\"DescribeTopicsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTopicsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeTopicsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DetectDominantLanguage\":{\
      \"name\":\"DetectDominantLanguage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectDominantLanguageRequest\"},\
      \"output\":{\"shape\":\"DetectDominantLanguageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href=\\\"http://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html\\\">Amazon Comprehend Supported Languages</a>. </p>\"\
    },\
    \"DetectEntities\":{\
      \"name\":\"DetectEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectEntitiesRequest\"},\
      \"output\":{\"shape\":\"DetectEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text for entities, and returns information about them. For more information, about entities, see <a>how-entities</a>. </p>\"\
    },\
    \"DetectKeyPhrases\":{\
      \"name\":\"DetectKeyPhrases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectKeyPhrasesRequest\"},\
      \"output\":{\"shape\":\"DetectKeyPhrasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects the key noun phrases found in the text. </p>\"\
    },\
    \"DetectSentiment\":{\
      \"name\":\"DetectSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectSentimentRequest\"},\
      \"output\":{\"shape\":\"DetectSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text and returns an inference of the prevailing sentiment (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>). </p>\"\
    },\
    \"ListTopicsDetectionJobs\":{\
      \"name\":\"ListTopicsDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTopicsDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTopicsDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the topic detection jobs that you have submitted.</p>\"\
    },\
    \"StartTopicsDetectionJob\":{\
      \"name\":\"StartTopicsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTopicsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartTopicsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AnyLengthString\":{\"type\":\"string\"},\
    \"BatchDetectDominantLanguageItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Languages\":{\
          \"shape\":\"ListOfDominantLanguages\",\
          \"documentation\":\"<p>One or more <a>DominantLanguage</a> objects describing the dominant languages in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectDominantLanguageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TextList\"],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters and must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>\"\
        }\
      }\
    },\
    \"BatchDetectDominantLanguageResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectDominantLanguageResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      }\
    },\
    \"BatchDetectEntitiesItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Entities\":{\
          \"shape\":\"ListOfEntities\",\
          \"documentation\":\"<p>One or more <a>Entity</a> objects, one for each entity detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The language of the input documents. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectEntitiesResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      }\
    },\
    \"BatchDetectKeyPhrasesItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"KeyPhrases\":{\
          \"shape\":\"ListOfKeyPhrases\",\
          \"documentation\":\"<p>One or more <a>KeyPhrase</a> objects, one for each key phrase detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectKeyPhrasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The language of the input documents. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectKeyPhrasesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectKeyPhrasesResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      }\
    },\
    \"BatchDetectSentimentItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The sentiment detected in the document.</p>\"\
        },\
        \"SentimentScore\":{\
          \"shape\":\"SentimentScore\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its sentiment detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The language of the input documents. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectSentimentResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectSentimentResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      }\
    },\
    \"BatchItemError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The numeric error code of the error.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A text description of the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an error that occurred while processing a document in a batch. The operation returns on <code>BatchItemError</code> object for each document that contained an error.</p>\"\
    },\
    \"BatchItemErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchItemError\"}\
    },\
    \"BatchSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of documents in the request exceeds the limit of 25. Try your request again with fewer documents.</p>\",\
      \"exception\":true\
    },\
    \"ClientRequestTokenString\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-]+$\"\
    },\
    \"DescribeTopicsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned by the user to the detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeTopicsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicsDetectionJobProperties\":{\
          \"shape\":\"TopicsDetectionJobProperties\",\
          \"documentation\":\"<p>The list of properties for the requested job.</p>\"\
        }\
      }\
    },\
    \"DetectDominantLanguageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Text\"],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string should contain at least 20 characters and must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        }\
      }\
    },\
    \"DetectDominantLanguageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Languages\":{\
          \"shape\":\"ListOfDominantLanguages\",\
          \"documentation\":\"<p>The languages that Amazon Comprehend detected in the input text. For each language, the response returns the RFC 5646 language code and the level of confidence that Amazon Comprehend has in the accuracy of its inference. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        }\
      }\
    },\
    \"DetectEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The RFC 5646 language code of the input text. If the request does not specify the language code, the service detects the dominant language. If you specify a language code that the service does not support, it returns <code>UnsupportedLanguageException</code> exception. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site. </p>\"\
        }\
      }\
    },\
    \"DetectEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Entities\":{\
          \"shape\":\"ListOfEntities\",\
          \"documentation\":\"<p>A collection of entities identified in the input text. For each entity, the response provides the entity text, entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection. For a list of entity types, see <a>how-entities</a>. </p>\"\
        }\
      }\
    },\
    \"DetectKeyPhrasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The RFC 5646 language code for the input text. If you don't specify a language code, Amazon Comprehend detects the dominant language. If you specify the code for a language that Amazon Comprehend does not support, it returns and <code>UnsupportedLanguageException</code>. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        }\
      }\
    },\
    \"DetectKeyPhrasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrases\":{\
          \"shape\":\"ListOfKeyPhrases\",\
          \"documentation\":\"<p>A collection of key phrases that Amazon Comprehend identified in the input text. For each key phrase, the response provides the text of the key phrase, where the key phrase begins and ends, and the level of confidence that Amazon Comprehend has in the accuracy of the detection. </p>\"\
        }\
      }\
    },\
    \"DetectSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The RFC 5646 language code for the input text. If you don't specify a language code, Amazon Comprehend detects the dominant language. If you specify the code for a language that Amazon Comprehend does not support, it returns and <code>UnsupportedLanguageException</code>. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        }\
      }\
    },\
    \"DetectSentimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The inferred sentiment that Amazon Comprehend has the highest level of confidence in.</p>\"\
        },\
        \"SentimentScore\":{\
          \"shape\":\"SentimentScore\",\
          \"documentation\":\"<p>An object that lists the sentiments, and their corresponding confidence levels.</p>\"\
        }\
      }\
    },\
    \"DominantLanguage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The RFC 5646 language code for the dominant language. </p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returns the code for the dominant language in the input text and the level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
    },\
    \"Entity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"EntityType\",\
          \"documentation\":\"<p>The entity's type.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of the entity.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the entity begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the entity ends. The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about an entity. </p> <p> </p>\"\
    },\
    \"EntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERSON\",\
        \"LOCATION\",\
        \"ORGANIZATION\",\
        \"COMMERCIAL_ITEM\",\
        \"EVENT\",\
        \"DATE\",\
        \"QUANTITY\",\
        \"TITLE\",\
        \"OTHER\"\
      ]\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"IamRoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+\"\
    },\
    \"InputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the input data. The URI must be in same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of data files. </p> <p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>\"\
        },\
        \"InputFormat\":{\
          \"shape\":\"InputFormat\",\
          \"documentation\":\"<p>Specifies how the text in an input file should be processed:</p> <ul> <li> <p> <code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers.</p> </li> <li> <p> <code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The input properties for a topic detection job.</p>\"\
    },\
    \"InputFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ONE_DOC_PER_FILE\",\
        \"ONE_DOC_PER_LINE\"\
      ]\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>An internal server error occurred. Retry your request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidFilterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The filter specified for the <code>ListTopicDetectionJobs</code> operation is invalid. Specify a different filter.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request is invalid.</p>\",\
      \"exception\":true\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1\
    },\
    \"JobName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-%@]*)$\"\
    },\
    \"JobNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified job was not found. Check the job ID and try again.</p>\",\
      \"exception\":true\
    },\
    \"JobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"IN_PROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\"\
      ]\
    },\
    \"KeyPhrase\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of a key noun phrase.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the key phrase begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text where the key phrase ends. The offset returns the position of each UTF-8 code point in the string. A <code>code point</code> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key noun phrase.</p>\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en\",\
        \"es\"\
      ]\
    },\
    \"ListOfDetectDominantLanguageResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectDominantLanguageItemResult\"}\
    },\
    \"ListOfDetectEntitiesResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectEntitiesItemResult\"}\
    },\
    \"ListOfDetectKeyPhrasesResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectKeyPhrasesItemResult\"}\
    },\
    \"ListOfDetectSentimentResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectSentimentItemResult\"}\
    },\
    \"ListOfDominantLanguages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DominantLanguage\"}\
    },\
    \"ListOfEntities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Entity\"}\
    },\
    \"ListOfKeyPhrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyPhrase\"}\
    },\
    \"ListTopicsDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"TopicsDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time that they were submitted. You can set only one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page.</p>\"\
        }\
      }\
    },\
    \"ListTopicsDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicsDetectionJobPropertiesList\":{\
          \"shape\":\"TopicsDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"MaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"NumberOfTopicsInteger\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"OutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. </p> <p>The service creates an output file called <code>output.tar.gz</code>. It is a compressed archive that contains two files, <code>topic-terms.csv</code> that lists the terms associated with each topic, and <code>doc-topics.csv</code> that lists the documents associated with each topic. For more information, see <a>topic-modeling</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for the output of topic detection jobs.</p> <p/>\"\
    },\
    \"S3Uri\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"s3://([^/]+)(/.*)?\"\
    },\
    \"SentimentScore\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Positive\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>POSITIVE</code> sentiment.</p>\"\
        },\
        \"Negative\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEGATIVE</code> sentiment.</p>\"\
        },\
        \"Neutral\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEUTRAL</code> sentiment.</p>\"\
        },\
        \"Mixed\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>MIXED</code> sentiment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of sentiments.</p>\"\
    },\
    \"SentimentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"POSITIVE\",\
        \"NEGATIVE\",\
        \"NEUTRAL\",\
        \"MIXED\"\
      ]\
    },\
    \"StartTopicsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"NumberOfTopics\":{\
          \"shape\":\"NumberOfTopicsInteger\",\
          \"documentation\":\"<p>The number of topics to detect.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartTopicsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of the job, use this identifier with the <code>DescribeTopicDetectionJob</code> operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job: </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the <code>DescribeTopicDetectionJob</code> operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"TextSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The size of the input text exceeds the limit. Use a smaller document.</p>\",\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of requests exceeds the limit. Resubmit your request later.</p>\",\
      \"exception\":true\
    },\
    \"TopicsDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p/>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of topic detection jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering topic detection jobs. For more information, see .</p>\"\
    },\
    \"TopicsDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the topic detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name of the topic detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the topic detection job. If the status is <code>Failed</code>, the reason for the failure is shown in the <code>Message</code> field.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description for the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the topic detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the topic detection job was completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration supplied when you created the topic detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration supplied when you created the topic detection job.</p>\"\
        },\
        \"NumberOfTopics\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of topics to detect supplied when you created the topic detection job. The default is 10. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a topic detection job.</p>\"\
    },\
    \"TopicsDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicsDetectionJobProperties\"}\
    },\
    \"UnsupportedLanguageException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Amazon Comprehend can't process the language of the input text. For all APIs except <code>DetectDominantLanguage</code>, Amazon Comprehend accepts only English or Spanish text. For the <code>DetectDominantLanguage</code> API, Amazon Comprehend detects 100 languages. For a list of languages, see <a>how-languages</a> </p>\",\
      \"exception\":true\
    }\
  },\
  \"documentation\":\"<p>Amazon Comprehend is an AWS service for gaining insight into the content of documents. Use these actions to determine the topics contained in your documents, the topics they discuss, the predominant sentiment expressed in them, the predominant language used, and more.</p>\"\
}\
";
}

@end
