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

#import "AWSKMSResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKMSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKMSResources

+ (instancetype)sharedInstance {
    static AWSKMSResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKMSResources new];
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
    \"apiVersion\":\"2014-11-01\",\
    \"endpointPrefix\":\"kms\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"KMS\",\
    \"serviceFullName\":\"AWS Key Management Service\",\
    \"serviceId\":\"KMS\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"TrentService\",\
    \"uid\":\"kms-2014-11-01\"\
  },\
  \"operations\":{\
    \"CancelKeyDeletion\":{\
      \"name\":\"CancelKeyDeletion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelKeyDeletionRequest\"},\
      \"output\":{\"shape\":\"CancelKeyDeletionResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Cancels the deletion of a customer master key (CMK). When this operation is successful, the CMK is set to the <code>Disabled</code> state. To enable a CMK, use <a>EnableKey</a>. You cannot perform this operation on a CMK in a different AWS account.</p> <p>For more information about scheduling and canceling deletion of a CMK, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html\\\">Deleting Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"CreateAlias\":{\
      \"name\":\"CreateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidAliasNameException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Creates a display name for a customer master key (CMK). You can use an alias to identify a CMK in selected operations, such as <a>Encrypt</a> and <a>GenerateDataKey</a>. </p> <p>Each CMK can have multiple aliases, but each alias points to only one CMK. The alias name must be unique in the AWS account and region. To simplify code that runs in multiple regions, use the same alias name, but point it to a different CMK in each region. </p> <p>Because an alias is not a property of a CMK, you can delete and change the aliases of a CMK without affecting the CMK. Also, aliases do not appear in the response from the <a>DescribeKey</a> operation. To get the aliases of all CMKs, use the <a>ListAliases</a> operation.</p> <p>An alias must start with the word <code>alias</code> followed by a forward slash (<code>alias/</code>). The alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). Alias names cannot begin with <code>aws</code>; that alias name prefix is reserved by Amazon Web Services (AWS).</p> <p>The alias and the CMK it is mapped to must be in the same AWS account and the same region. You cannot perform this operation on an alias in a different AWS account.</p> <p>To map an existing alias to a different CMK, call <a>UpdateAlias</a>.</p>\"\
    },\
    \"CreateGrant\":{\
      \"name\":\"CreateGrant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateGrantRequest\"},\
      \"output\":{\"shape\":\"CreateGrantResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Adds a grant to a customer master key (CMK). The grant specifies who can use the CMK and under what conditions. When setting permissions, grants are an alternative to key policies. </p> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN in the value of the KeyId parameter. For more information about grants, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/grants.html\\\">Grants</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"CreateKey\":{\
      \"name\":\"CreateKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateKeyRequest\"},\
      \"output\":{\"shape\":\"CreateKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TagException\"}\
      ],\
      \"documentation\":\"<p>Creates a customer master key (CMK) in the caller's AWS account.</p> <p>You can use a CMK to encrypt small amounts of data (4 KiB or less) directly, but CMKs are more commonly used to encrypt data encryption keys (DEKs), which are used to encrypt raw data. For more information about DEKs and the difference between CMKs and DEKs, see the following:</p> <ul> <li> <p>The <a>GenerateDataKey</a> operation</p> </li> <li> <p> <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html\\\">AWS Key Management Service Concepts</a> in the <i>AWS Key Management Service Developer Guide</i> </p> </li> </ul> <p>You cannot use this operation to create a CMK in a different AWS account.</p>\"\
    },\
    \"Decrypt\":{\
      \"name\":\"Decrypt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DecryptRequest\"},\
      \"output\":{\"shape\":\"DecryptResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidCiphertextException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Decrypts ciphertext. Ciphertext is plaintext that has been previously encrypted by using any of the following operations:</p> <ul> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> <li> <p> <a>Encrypt</a> </p> </li> </ul> <p>Note that if a caller has been granted access permissions to all keys (through, for example, IAM user policies that grant <code>Decrypt</code> permission on all resources), then ciphertext encrypted by using keys in other accounts where the key grants access to the caller can be decrypted. To remedy this, we recommend that you do not grant <code>Decrypt</code> access in an IAM user policy. Instead grant <code>Decrypt</code> access only in key policies. If you must grant <code>Decrypt</code> access in an IAM user policy, you should scope the resource to specific keys or to specific trusted accounts.</p>\"\
    },\
    \"DeleteAlias\":{\
      \"name\":\"DeleteAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified alias. You cannot perform this operation on an alias in a different AWS account. </p> <p>Because an alias is not a property of a CMK, you can delete and change the aliases of a CMK without affecting the CMK. Also, aliases do not appear in the response from the <a>DescribeKey</a> operation. To get the aliases of all CMKs, use the <a>ListAliases</a> operation. </p> <p>Each CMK can have multiple aliases. To change the alias of a CMK, use <a>DeleteAlias</a> to delete the current alias and <a>CreateAlias</a> to create a new alias. To associate an existing alias with a different customer master key (CMK), call <a>UpdateAlias</a>.</p>\"\
    },\
    \"DeleteImportedKeyMaterial\":{\
      \"name\":\"DeleteImportedKeyMaterial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteImportedKeyMaterialRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Deletes key material that you previously imported. This operation makes the specified customer master key (CMK) unusable. For more information about importing key material into AWS KMS, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>. You cannot perform this operation on a CMK in a different AWS account.</p> <p>When the specified CMK is in the <code>PendingDeletion</code> state, this operation does not change the CMK's state. Otherwise, it changes the CMK's state to <code>PendingImport</code>.</p> <p>After you delete key material, you can use <a>ImportKeyMaterial</a> to reimport the same key material into the CMK.</p>\"\
    },\
    \"DescribeKey\":{\
      \"name\":\"DescribeKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeKeyRequest\"},\
      \"output\":{\"shape\":\"DescribeKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Provides detailed information about the specified customer master key (CMK).</p> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN or alias ARN in the value of the KeyId parameter.</p>\"\
    },\
    \"DisableKey\":{\
      \"name\":\"DisableKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Sets the state of a customer master key (CMK) to disabled, thereby preventing its use for cryptographic operations. You cannot perform this operation on a CMK in a different AWS account.</p> <p>For more information about how key state affects the use of a CMK, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">How Key State Affects the Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"DisableKeyRotation\":{\
      \"name\":\"DisableKeyRotation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableKeyRotationRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Disables automatic rotation of the key material for the specified customer master key (CMK). You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    },\
    \"EnableKey\":{\
      \"name\":\"EnableKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Sets the state of a customer master key (CMK) to enabled, thereby permitting its use for cryptographic operations. You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    },\
    \"EnableKeyRotation\":{\
      \"name\":\"EnableKeyRotation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableKeyRotationRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Enables automatic rotation of the key material for the specified customer master key (CMK). You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    },\
    \"Encrypt\":{\
      \"name\":\"Encrypt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EncryptRequest\"},\
      \"output\":{\"shape\":\"EncryptResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Encrypts plaintext into ciphertext by using a customer master key (CMK). The <code>Encrypt</code> operation has two primary use cases:</p> <ul> <li> <p>You can encrypt up to 4 kilobytes (4096 bytes) of arbitrary data such as an RSA key, a database password, or other sensitive information.</p> </li> <li> <p>To move encrypted data from one AWS region to another, you can use this operation to encrypt in the new region the plaintext data key that was used to encrypt the data in the original region. This provides you with an encrypted copy of the data key that can be decrypted in the new region and used there to decrypt the encrypted data.</p> </li> </ul> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN or alias ARN in the value of the KeyId parameter.</p> <p>Unless you are moving encrypted data from one region to another, you don't use this operation to encrypt a generated data key within a region. To get data keys that are already encrypted, call the <a>GenerateDataKey</a> or <a>GenerateDataKeyWithoutPlaintext</a> operation. Data keys don't need to be encrypted again by calling <code>Encrypt</code>.</p> <p>To encrypt data locally in your application, use the <a>GenerateDataKey</a> operation to return a plaintext data encryption key and a copy of the key encrypted under the CMK of your choosing.</p>\"\
    },\
    \"GenerateDataKey\":{\
      \"name\":\"GenerateDataKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateDataKeyRequest\"},\
      \"output\":{\"shape\":\"GenerateDataKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Returns a data encryption key that you can use in your application to encrypt data locally. </p> <p>You must specify the customer master key (CMK) under which to generate the data key. You must also specify the length of the data key using either the <code>KeySpec</code> or <code>NumberOfBytes</code> field. You must specify one field or the other, but not both. For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use <code>KeySpec</code>. To perform this operation on a CMK in a different AWS account, specify the key ARN or alias ARN in the value of the KeyId parameter.</p> <p>This operation returns a plaintext copy of the data key in the <code>Plaintext</code> field of the response, and an encrypted copy of the data key in the <code>CiphertextBlob</code> field. The data key is encrypted under the CMK specified in the <code>KeyId</code> field of the request. </p> <p>We recommend that you use the following pattern to encrypt data locally in your application:</p> <ol> <li> <p>Use this operation (<code>GenerateDataKey</code>) to get a data encryption key.</p> </li> <li> <p>Use the plaintext data encryption key (returned in the <code>Plaintext</code> field of the response) to encrypt data locally, then erase the plaintext data key from memory.</p> </li> <li> <p>Store the encrypted data key (returned in the <code>CiphertextBlob</code> field of the response) alongside the locally encrypted data.</p> </li> </ol> <p>To decrypt data locally:</p> <ol> <li> <p>Use the <a>Decrypt</a> operation to decrypt the encrypted data key into a plaintext copy of the data key.</p> </li> <li> <p>Use the plaintext data key to decrypt data locally, then erase the plaintext data key from memory.</p> </li> </ol> <p>To return only an encrypted copy of the data key, use <a>GenerateDataKeyWithoutPlaintext</a>. To return a random byte string that is cryptographically secure, use <a>GenerateRandom</a>.</p> <p>If you use the optional <code>EncryptionContext</code> field, you must store at least enough information to be able to reconstruct the full encryption context when you later send the ciphertext to the <a>Decrypt</a> operation. It is a good practice to choose an encryption context that you can reconstruct on the fly to better secure the ciphertext. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"GenerateDataKeyWithoutPlaintext\":{\
      \"name\":\"GenerateDataKeyWithoutPlaintext\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateDataKeyWithoutPlaintextRequest\"},\
      \"output\":{\"shape\":\"GenerateDataKeyWithoutPlaintextResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Returns a data encryption key encrypted under a customer master key (CMK). This operation is identical to <a>GenerateDataKey</a> but returns only the encrypted copy of the data key. </p> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN or alias ARN in the value of the KeyId parameter.</p> <p>This operation is useful in a system that has multiple components with different degrees of trust. For example, consider a system that stores encrypted data in containers. Each container stores the encrypted data and an encrypted copy of the data key. One component of the system, called the <i>control plane</i>, creates new containers. When it creates a new container, it uses this operation (<code>GenerateDataKeyWithoutPlaintext</code>) to get an encrypted data key and then stores it in the container. Later, a different component of the system, called the <i>data plane</i>, puts encrypted data into the containers. To do this, it passes the encrypted data key to the <a>Decrypt</a> operation, then uses the returned plaintext data key to encrypt data, and finally stores the encrypted data in the container. In this system, the control plane never sees the plaintext data key.</p>\"\
    },\
    \"GenerateRandom\":{\
      \"name\":\"GenerateRandom\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateRandomRequest\"},\
      \"output\":{\"shape\":\"GenerateRandomResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Returns a random byte string that is cryptographically secure.</p> <p>For more information about entropy and random number generation, see the <a href=\\\"https://d0.awsstatic.com/whitepapers/KMS-Cryptographic-Details.pdf\\\">AWS Key Management Service Cryptographic Details</a> whitepaper.</p>\"\
    },\
    \"GetKeyPolicy\":{\
      \"name\":\"GetKeyPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetKeyPolicyRequest\"},\
      \"output\":{\"shape\":\"GetKeyPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Gets a key policy attached to the specified customer master key (CMK). You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    },\
    \"GetKeyRotationStatus\":{\
      \"name\":\"GetKeyRotationStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetKeyRotationStatusRequest\"},\
      \"output\":{\"shape\":\"GetKeyRotationStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Gets a Boolean value that indicates whether automatic rotation of the key material is enabled for the specified customer master key (CMK).</p> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN in the value of the KeyId parameter.</p>\"\
    },\
    \"GetParametersForImport\":{\
      \"name\":\"GetParametersForImport\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetParametersForImportRequest\"},\
      \"output\":{\"shape\":\"GetParametersForImportResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Returns the items you need in order to import key material into AWS KMS from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p> <p>You must specify the key ID of the customer master key (CMK) into which you will import key material. This CMK's <code>Origin</code> must be <code>EXTERNAL</code>. You must also specify the wrapping algorithm and type of wrapping key (public key) that you will use to encrypt the key material. You cannot perform this operation on a CMK in a different AWS account.</p> <p>This operation returns a public key and an import token. Use the public key to encrypt the key material. Store the import token to send with a subsequent <a>ImportKeyMaterial</a> request. The public key and import token from the same response must be used together. These items are valid for 24 hours. When they expire, they cannot be used for a subsequent <a>ImportKeyMaterial</a> request. To get new ones, send another <code>GetParametersForImport</code> request.</p>\"\
    },\
    \"ImportKeyMaterial\":{\
      \"name\":\"ImportKeyMaterial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportKeyMaterialRequest\"},\
      \"output\":{\"shape\":\"ImportKeyMaterialResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"InvalidCiphertextException\"},\
        {\"shape\":\"IncorrectKeyMaterialException\"},\
        {\"shape\":\"ExpiredImportTokenException\"},\
        {\"shape\":\"InvalidImportTokenException\"}\
      ],\
      \"documentation\":\"<p>Imports key material into an existing AWS KMS customer master key (CMK) that was created without key material. You cannot perform this operation on a CMK in a different AWS account. For more information about creating CMKs with no key material and then importing key material, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p> <p>Before using this operation, call <a>GetParametersForImport</a>. Its response includes a public key and an import token. Use the public key to encrypt the key material. Then, submit the import token from the same <code>GetParametersForImport</code> response.</p> <p>When calling this operation, you must specify the following values:</p> <ul> <li> <p>The key ID or key ARN of a CMK with no key material. Its <code>Origin</code> must be <code>EXTERNAL</code>.</p> <p>To create a CMK with no key material, call <a>CreateKey</a> and set the value of its <code>Origin</code> parameter to <code>EXTERNAL</code>. To get the <code>Origin</code> of a CMK, call <a>DescribeKey</a>.)</p> </li> <li> <p>The encrypted key material. To get the public key to encrypt the key material, call <a>GetParametersForImport</a>.</p> </li> <li> <p>The import token that <a>GetParametersForImport</a> returned. This token and the public key used to encrypt the key material must have come from the same response.</p> </li> <li> <p>Whether the key material expires and if so, when. If you set an expiration date, you can change it only by reimporting the same key material and specifying a new expiration date. If the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. To use the CMK again, you must reimport the same key material.</p> </li> </ul> <p>When this operation is successful, the CMK's key state changes from <code>PendingImport</code> to <code>Enabled</code>, and you can use the CMK. After you successfully import key material into a CMK, you can reimport the same key material into that CMK, but you cannot import different key material.</p>\"\
    },\
    \"ListAliases\":{\
      \"name\":\"ListAliases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAliasesRequest\"},\
      \"output\":{\"shape\":\"ListAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all aliases in the caller's AWS account and region. You cannot list aliases in other accounts. For more information about aliases, see <a>CreateAlias</a>.</p> <p>The response might include several aliases that do not have a <code>TargetKeyId</code> field because they are not associated with a CMK. These are predefined aliases that are reserved for CMKs managed by AWS services. If an alias is not associated with a CMK, the alias does not count against the <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit\\\">alias limit</a> for your account.</p>\"\
    },\
    \"ListGrants\":{\
      \"name\":\"ListGrants\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListGrantsRequest\"},\
      \"output\":{\"shape\":\"ListGrantsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all grants for the specified customer master key (CMK).</p> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN in the value of the KeyId parameter.</p>\"\
    },\
    \"ListKeyPolicies\":{\
      \"name\":\"ListKeyPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListKeyPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListKeyPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Gets the names of the key policies that are attached to a customer master key (CMK). This operation is designed to get policy names that you can use in a <a>GetKeyPolicy</a> operation. However, the only valid policy name is <code>default</code>. You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    },\
    \"ListKeys\":{\
      \"name\":\"ListKeys\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListKeysRequest\"},\
      \"output\":{\"shape\":\"ListKeysResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"InvalidMarkerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all customer master keys (CMKs) in the caller's AWS account and region.</p>\"\
    },\
    \"ListResourceTags\":{\
      \"name\":\"ListResourceTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListResourceTagsRequest\"},\
      \"output\":{\"shape\":\"ListResourceTagsResponse\"},\
      \"errors\":[\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidMarkerException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all tags for the specified customer master key (CMK).</p> <p>You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    },\
    \"ListRetirableGrants\":{\
      \"name\":\"ListRetirableGrants\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListRetirableGrantsRequest\"},\
      \"output\":{\"shape\":\"ListGrantsResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all grants for which the grant's <code>RetiringPrincipal</code> matches the one specified.</p> <p>A typical use is to list all grants that you are able to retire. To retire a grant, use <a>RetireGrant</a>.</p>\"\
    },\
    \"PutKeyPolicy\":{\
      \"name\":\"PutKeyPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutKeyPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Attaches a key policy to the specified customer master key (CMK). You cannot perform this operation on a CMK in a different AWS account.</p> <p>For more information about key policies, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Key Policies</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"ReEncrypt\":{\
      \"name\":\"ReEncrypt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReEncryptRequest\"},\
      \"output\":{\"shape\":\"ReEncryptResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidCiphertextException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Encrypts data on the server side with a new customer master key (CMK) without exposing the plaintext of the data on the client side. The data is first decrypted and then reencrypted. You can also use this operation to change the encryption context of a ciphertext. </p> <p>You can reencrypt data using CMKs in different AWS accounts.</p> <p>Unlike other operations, <code>ReEncrypt</code> is authorized twice, once as <code>ReEncryptFrom</code> on the source CMK and once as <code>ReEncryptTo</code> on the destination CMK. We recommend that you include the <code>\\\"kms:ReEncrypt*\\\"</code> permission in your <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">key policies</a> to permit reencryption from or to the CMK. This permission is automatically included in the key policy when you create a CMK through the console, but you must include it manually when you create a CMK programmatically or when you set a key policy with the <a>PutKeyPolicy</a> operation.</p>\"\
    },\
    \"RetireGrant\":{\
      \"name\":\"RetireGrant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RetireGrantRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"InvalidGrantIdException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Retires a grant. To clean up, you can retire a grant when you're done using it. You should revoke a grant when you intend to actively deny operations that depend on it. The following are permitted to call this API:</p> <ul> <li> <p>The AWS account (root user) under which the grant was created</p> </li> <li> <p>The <code>RetiringPrincipal</code>, if present in the grant</p> </li> <li> <p>The <code>GranteePrincipal</code>, if <code>RetireGrant</code> is an operation specified in the grant</p> </li> </ul> <p>You must identify the grant to retire by its grant token or by a combination of the grant ID and the Amazon Resource Name (ARN) of the customer master key (CMK). A grant token is a unique variable-length base64-encoded string. A grant ID is a 64 character unique identifier of a grant. The <a>CreateGrant</a> operation returns both.</p>\"\
    },\
    \"RevokeGrant\":{\
      \"name\":\"RevokeGrant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RevokeGrantRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidGrantIdException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Revokes the specified grant for the specified customer master key (CMK). You can revoke a grant to actively deny operations that depend on it.</p> <p>To perform this operation on a CMK in a different AWS account, specify the key ARN in the value of the KeyId parameter.</p>\"\
    },\
    \"ScheduleKeyDeletion\":{\
      \"name\":\"ScheduleKeyDeletion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ScheduleKeyDeletionRequest\"},\
      \"output\":{\"shape\":\"ScheduleKeyDeletionResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Schedules the deletion of a customer master key (CMK). You may provide a waiting period, specified in days, before deletion occurs. If you do not provide a waiting period, the default period of 30 days is used. When this operation is successful, the state of the CMK changes to <code>PendingDeletion</code>. Before the waiting period ends, you can use <a>CancelKeyDeletion</a> to cancel the deletion of the CMK. After the waiting period ends, AWS KMS deletes the CMK and all AWS KMS data associated with it, including all aliases that refer to it.</p> <p>You cannot perform this operation on a CMK in a different AWS account.</p> <important> <p>Deleting a CMK is a destructive and potentially dangerous operation. When a CMK is deleted, all data that was encrypted under the CMK is rendered unrecoverable. To restrict the use of a CMK without deleting it, use <a>DisableKey</a>.</p> </important> <p>For more information about scheduling a CMK for deletion, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html\\\">Deleting Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TagException\"}\
      ],\
      \"documentation\":\"<p>Adds or overwrites one or more tags for the specified customer master key (CMK). You cannot perform this operation on a CMK in a different AWS account.</p> <p>Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p> <p>You cannot use the same tag key more than once per CMK. For example, consider a CMK with one tag whose tag key is <code>Purpose</code> and tag value is <code>Test</code>. If you send a <code>TagResource</code> request for this CMK with a tag key of <code>Purpose</code> and a tag value of <code>Prod</code>, it does not create a second tag. Instead, the original tag is overwritten with the new tag value.</p> <p>For information about the rules that apply to tag keys and tag values, see <a href=\\\"http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html\\\">User-Defined Tag Restrictions</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"TagException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tag or tags from the specified customer master key (CMK). You cannot perform this operation on a CMK in a different AWS account.</p> <p>To remove a tag, you specify the tag key for each tag to remove. You do not specify the tag value. To overwrite the tag value for an existing tag, use <a>TagResource</a>.</p>\"\
    },\
    \"UpdateAlias\":{\
      \"name\":\"UpdateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Associates an existing alias with a different customer master key (CMK). Each CMK can have multiple aliases, but the aliases must be unique within the account and region. You cannot perform this operation on an alias in a different AWS account.</p> <p>This operation works only on existing aliases. To change the alias of a CMK to a new value, use <a>CreateAlias</a> to create a new alias and <a>DeleteAlias</a> to delete the old alias.</p> <p>Because an alias is not a property of a CMK, you can create, update, and delete the aliases of a CMK without affecting the CMK. Also, aliases do not appear in the response from the <a>DescribeKey</a> operation. To get the aliases of all CMKs in the account, use the <a>ListAliases</a> operation. </p> <p>An alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). An alias must start with the word <code>alias</code> followed by a forward slash (<code>alias/</code>). The alias name can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). Alias names cannot begin with <code>aws</code>; that alias name prefix is reserved by Amazon Web Services (AWS).</p>\"\
    },\
    \"UpdateKeyDescription\":{\
      \"name\":\"UpdateKeyDescription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateKeyDescriptionRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Updates the description of a customer master key (CMK). To see the decription of a CMK, use <a>DescribeKey</a>. </p> <p>You cannot perform this operation on a CMK in a different AWS account.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AWSAccountIdType\":{\"type\":\"string\"},\
    \"AlgorithmSpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RSAES_PKCS1_V1_5\",\
        \"RSAES_OAEP_SHA_1\",\
        \"RSAES_OAEP_SHA_256\"\
      ]\
    },\
    \"AliasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasListEntry\"}\
    },\
    \"AliasListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>String that contains the alias.</p>\"\
        },\
        \"AliasArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>String that contains the key ARN.</p>\"\
        },\
        \"TargetKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>String that contains the key identifier referred to by the alias.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an alias.</p>\"\
    },\
    \"AliasNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9:/_-]+$\"\
    },\
    \"AlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because it attempted to create a resource that already exists.</p>\",\
      \"exception\":true\
    },\
    \"ArnType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"BooleanType\":{\"type\":\"boolean\"},\
    \"CancelKeyDeletionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier for the customer master key (CMK) for which to cancel deletion.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"CancelKeyDeletionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier of the master key for which deletion is canceled.</p>\"\
        }\
      }\
    },\
    \"CiphertextType\":{\
      \"type\":\"blob\",\
      \"max\":6144,\
      \"min\":1\
    },\
    \"CreateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AliasName\",\
        \"TargetKeyId\"\
      ],\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>String that contains the display name. The name must start with the word \\\"alias\\\" followed by a forward slash (alias/). Aliases that begin with \\\"alias/AWS\\\" are reserved.</p>\"\
        },\
        \"TargetKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the CMK for which you are creating the alias. This value cannot be an alias.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"CreateGrantRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"GranteePrincipal\",\
        \"Operations\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier for the customer master key (CMK) that the grant applies to.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To specify a CMK in a different AWS account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"GranteePrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The principal that is given permission to perform the operations that the grant permits.</p> <p>To specify the principal, use the <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include AWS accounts (root), IAM users, IAM roles, federated users, and assumed role users. For examples of the ARN syntax to use for specifying a principal, see <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam\\\">AWS Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>AWS General Reference</i>.</p>\"\
        },\
        \"RetiringPrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The principal that is given permission to retire the grant by using <a>RetireGrant</a> operation.</p> <p>To specify the principal, use the <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include AWS accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax to use for specifying a principal, see <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam\\\">AWS Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>AWS General Reference</i>.</p>\"\
        },\
        \"Operations\":{\
          \"shape\":\"GrantOperationList\",\
          \"documentation\":\"<p>A list of operations that the grant permits.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"GrantConstraints\",\
          \"documentation\":\"<p>A structure that you can use to allow certain operations in the grant only when the desired encryption context is present. For more information about encryption context, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"GrantNameType\",\
          \"documentation\":\"<p>A friendly name for identifying the grant. Use this value to prevent unintended creation of duplicate grants when retrying this request.</p> <p>When this value is absent, all <code>CreateGrant</code> requests result in a new grant with a unique <code>GrantId</code> even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the <code>CreateGrant</code> request.</p> <p>When this value is present, you can retry a <code>CreateGrant</code> request with identical parameters; if the grant already exists, the original <code>GrantId</code> is returned without creating a new grant. Note that the returned grant token is unique with every <code>CreateGrant</code> request, even when a duplicate <code>GrantId</code> is returned. All grant tokens obtained in this way can be used interchangeably.</p>\"\
        }\
      }\
    },\
    \"CreateGrantResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GrantToken\":{\
          \"shape\":\"GrantTokenType\",\
          \"documentation\":\"<p>The grant token.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>The unique identifier for the grant.</p> <p>You can use the <code>GrantId</code> in a subsequent <a>RetireGrant</a> or <a>RevokeGrant</a> operation.</p>\"\
        }\
      }\
    },\
    \"CreateKeyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The key policy to attach to the CMK.</p> <p>If you provide a key policy, it must meet the following criteria:</p> <ul> <li> <p>If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the key policy must allow the principal that is making the <code>CreateKey</code> request to make a subsequent <a>PutKeyPolicy</a> request on the CMK. This reduces the risk that the CMK becomes unmanageable. For more information, refer to the scenario in the <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam\\\">Default Key Policy</a> section of the <i>AWS Key Management Service Developer Guide</i>.</p> </li> <li> <p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to AWS KMS. When you create a new AWS principal (for example, an IAM user or role), you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to AWS KMS. For more information, see <a href=\\\"http://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency\\\">Changes that I make are not always immediately visible</a> in the <i>AWS Identity and Access Management User Guide</i>.</p> </li> </ul> <p>If you do not provide a key policy, AWS KMS attaches a default key policy to the CMK. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default\\\">Default Key Policy</a> in the <i>AWS Key Management Service Developer Guide</i>.</p> <p>The key policy size limit is 32 kilobytes (32768 bytes).</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>A description of the CMK.</p> <p>Use a description that helps you decide whether the CMK is appropriate for a task.</p>\"\
        },\
        \"KeyUsage\":{\
          \"shape\":\"KeyUsageType\",\
          \"documentation\":\"<p>The intended use of the CMK.</p> <p>You can use CMKs only for symmetric encryption and decryption.</p>\"\
        },\
        \"Origin\":{\
          \"shape\":\"OriginType\",\
          \"documentation\":\"<p>The source of the CMK's key material.</p> <p>The default is <code>AWS_KMS</code>, which means AWS KMS creates the key material. When this parameter is set to <code>EXTERNAL</code>, the request creates a CMK without key material so that you can import key material from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p> <p>The CMK's <code>Origin</code> is immutable and is set when the CMK is created.</p>\"\
        },\
        \"BypassPolicyLockoutSafetyCheck\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag to indicate whether to bypass the key policy lockout safety check.</p> <important> <p>Setting this value to true increases the risk that the CMK becomes unmanageable. Do not set this value to true indiscriminately.</p> <p>For more information, refer to the scenario in the <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam\\\">Default Key Policy</a> section in the <i>AWS Key Management Service Developer Guide</i>.</p> </important> <p>Use this parameter only when you include a policy in the request and you intend to prevent the principal that is making the request from making a subsequent <a>PutKeyPolicy</a> request on the CMK.</p> <p>The default value is false.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags. Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p> <p>Use this parameter to tag the CMK when it is created. Alternately, you can omit this parameter and instead tag the CMK after it is created using <a>TagResource</a>.</p>\"\
        }\
      }\
    },\
    \"CreateKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyMetadata\":{\
          \"shape\":\"KeyMetadata\",\
          \"documentation\":\"<p>Metadata associated with the CMK.</p>\"\
        }\
      }\
    },\
    \"DataKeySpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AES_256\",\
        \"AES_128\"\
      ]\
    },\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DecryptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CiphertextBlob\"],\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>Ciphertext to be decrypted. The blob includes metadata.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>The encryption context. If this was specified in the <a>Encrypt</a> function, it must be specified here or the decryption operation will fail. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"DecryptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>ARN of the key used to perform the decryption. This value is returned if no errors are encountered during the operation.</p>\"\
        },\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>Decrypted plaintext data. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded.</p>\"\
        }\
      }\
    },\
    \"DeleteAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AliasName\"],\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>The alias to be deleted. The name must start with the word \\\"alias\\\" followed by a forward slash (alias/). Aliases that begin with \\\"alias/aws\\\" are reserved.</p>\"\
        }\
      }\
    },\
    \"DeleteImportedKeyMaterialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK whose key material to delete. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"DependencyTimeoutException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The system timed out while trying to fulfill the request. The request can be retried.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"DescribeKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. When using an alias name, prefix it with \\\"alias/\\\". To specify a CMK in a different AWS account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyMetadata\":{\
          \"shape\":\"KeyMetadata\",\
          \"documentation\":\"<p>Metadata associated with the key.</p>\"\
        }\
      }\
    },\
    \"DescriptionType\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"min\":0\
    },\
    \"DisableKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"DisableKeyRotationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"DisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified CMK is not enabled.</p>\",\
      \"exception\":true\
    },\
    \"EnableKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"EnableKeyRotationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"EncryptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Plaintext\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. When using an alias name, prefix it with \\\"alias/\\\". To specify a CMK in a different AWS account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>Data to be encrypted.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Name-value pair that specifies the encryption context to be used for authenticated encryption. If used here, the same value must be supplied to the <code>Decrypt</code> API or decryption will fail. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"EncryptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted plaintext. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The ID of the key used during encryption.</p>\"\
        }\
      }\
    },\
    \"EncryptionContextKey\":{\"type\":\"string\"},\
    \"EncryptionContextType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EncryptionContextKey\"},\
      \"value\":{\"shape\":\"EncryptionContextValue\"}\
    },\
    \"EncryptionContextValue\":{\"type\":\"string\"},\
    \"ErrorMessageType\":{\"type\":\"string\"},\
    \"ExpirationModelType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"KEY_MATERIAL_EXPIRES\",\
        \"KEY_MATERIAL_DOES_NOT_EXPIRE\"\
      ]\
    },\
    \"ExpiredImportTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the provided import token is expired. Use <a>GetParametersForImport</a> to get a new import token and public key, use the new public key to encrypt the key material, and then try the request again.</p>\",\
      \"exception\":true\
    },\
    \"GenerateDataKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK under which to generate and encrypt the data encryption key.</p> <p>To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. When using an alias name, prefix it with \\\"alias/\\\". To specify a CMK in a different AWS account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>A set of key-value pairs that represents additional authenticated data.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"NumberOfBytes\":{\
          \"shape\":\"NumberOfBytesType\",\
          \"documentation\":\"<p>The length of the data encryption key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the <code>KeySpec</code> field instead of this one.</p>\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"DataKeySpec\",\
          \"documentation\":\"<p>The length of the data encryption key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted data encryption key. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded.</p>\"\
        },\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The data encryption key. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded. Use this data key for local encryption and decryption, then remove it from memory as soon as possible.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK under which the data encryption key was generated and encrypted.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyWithoutPlaintextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the customer master key (CMK) under which to generate and encrypt the data encryption key.</p> <p>To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. When using an alias name, prefix it with \\\"alias/\\\". To specify a CMK in a different AWS account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>A set of key-value pairs that represents additional authenticated data.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"DataKeySpec\",\
          \"documentation\":\"<p>The length of the data encryption key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p>\"\
        },\
        \"NumberOfBytes\":{\
          \"shape\":\"NumberOfBytesType\",\
          \"documentation\":\"<p>The length of the data encryption key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the <code>KeySpec</code> field instead of this one.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyWithoutPlaintextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted data encryption key. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK under which the data encryption key was generated and encrypted.</p>\"\
        }\
      }\
    },\
    \"GenerateRandomRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumberOfBytes\":{\
          \"shape\":\"NumberOfBytesType\",\
          \"documentation\":\"<p>The length of the byte string.</p>\"\
        }\
      }\
    },\
    \"GenerateRandomResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The random byte string. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded.</p>\"\
        }\
      }\
    },\
    \"GetKeyPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"PolicyName\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyNameType\",\
          \"documentation\":\"<p>Specifies the name of the key policy. The only valid name is <code>default</code>. To get the names of key policies, use <a>ListKeyPolicies</a>.</p>\"\
        }\
      }\
    },\
    \"GetKeyPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>A key policy document in JSON format.</p>\"\
        }\
      }\
    },\
    \"GetKeyRotationStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To specify a CMK in a different AWS account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"GetKeyRotationStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyRotationEnabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A Boolean value that specifies whether key rotation is enabled.</p>\"\
        }\
      }\
    },\
    \"GetParametersForImportRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"WrappingAlgorithm\",\
        \"WrappingKeySpec\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK into which you will import key material. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"WrappingAlgorithm\":{\
          \"shape\":\"AlgorithmSpec\",\
          \"documentation\":\"<p>The algorithm you will use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-encrypt-key-material.html\\\">Encrypt the Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"WrappingKeySpec\":{\
          \"shape\":\"WrappingKeySpec\",\
          \"documentation\":\"<p>The type of wrapping key (public key) to return in the response. Only 2048-bit RSA public keys are supported.</p>\"\
        }\
      }\
    },\
    \"GetParametersForImportResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK to use in a subsequent <a>ImportKeyMaterial</a> request. This is the same CMK specified in the <code>GetParametersForImport</code> request.</p>\"\
        },\
        \"ImportToken\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The import token to send in a subsequent <a>ImportKeyMaterial</a> request.</p>\"\
        },\
        \"PublicKey\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The public key to use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>.</p>\"\
        },\
        \"ParametersValidTo\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an <a>ImportKeyMaterial</a> request and you must send another <code>GetParametersForImport</code> request to get new ones.</p>\"\
        }\
      }\
    },\
    \"GrantConstraints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EncryptionContextSubset\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>A list of key-value pairs, all of which must be present in the encryption context of certain subsequent operations that the grant allows. When certain subsequent operations allowed by the grant include encryption context that matches this list or is a superset of this list, the grant allows the operation. Otherwise, the grant does not allow the operation.</p>\"\
        },\
        \"EncryptionContextEquals\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows. When certain subsequent operations allowed by the grant include encryption context that matches this list, the grant allows the operation. Otherwise, the grant does not allow the operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that you can use to allow certain operations in the grant only when the desired encryption context is present. For more information about encryption context, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html\\\">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p> <p>Grant constraints apply only to operations that accept encryption context as input. For example, the <code> <a>DescribeKey</a> </code> operation does not accept encryption context as input. A grant that allows the <code>DescribeKey</code> operation does so regardless of the grant constraints. In constrast, the <code> <a>Encrypt</a> </code> operation accepts encryption context as input. A grant that allows the <code>Encrypt</code> operation does so only when the encryption context of the <code>Encrypt</code> operation satisfies the grant constraints.</p>\"\
    },\
    \"GrantIdType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"GrantList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GrantListEntry\"}\
    },\
    \"GrantListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier for the customer master key (CMK) to which the grant applies.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>The unique identifier for the grant.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"GrantNameType\",\
          \"documentation\":\"<p>The friendly name that identifies the grant. If a name was provided in the <a>CreateGrant</a> request, that name is returned. Otherwise this value is null.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time when the grant was created.</p>\"\
        },\
        \"GranteePrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The principal that receives the grant's permissions.</p>\"\
        },\
        \"RetiringPrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The principal that can retire the grant.</p>\"\
        },\
        \"IssuingAccount\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The AWS account under which the grant was issued.</p>\"\
        },\
        \"Operations\":{\
          \"shape\":\"GrantOperationList\",\
          \"documentation\":\"<p>The list of operations permitted by the grant.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"GrantConstraints\",\
          \"documentation\":\"<p>A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an entry in a list of grants.</p>\"\
    },\
    \"GrantNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9:/_-]+$\"\
    },\
    \"GrantOperation\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Decrypt\",\
        \"Encrypt\",\
        \"GenerateDataKey\",\
        \"GenerateDataKeyWithoutPlaintext\",\
        \"ReEncryptFrom\",\
        \"ReEncryptTo\",\
        \"CreateGrant\",\
        \"RetireGrant\",\
        \"DescribeKey\"\
      ]\
    },\
    \"GrantOperationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GrantOperation\"}\
    },\
    \"GrantTokenList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GrantTokenType\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"GrantTokenType\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"min\":1\
    },\
    \"ImportKeyMaterialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"ImportToken\",\
        \"EncryptedKeyMaterial\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the CMK to import the key material into. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"ImportToken\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The import token that you received in the response to a previous <a>GetParametersForImport</a> request. It must be from the same response that contained the public key that you used to encrypt the key material.</p>\"\
        },\
        \"EncryptedKeyMaterial\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted key material to import. It must be encrypted with the public key that you received in the response to a previous <a>GetParametersForImport</a> request, using the wrapping algorithm that you specified in that request.</p>\"\
        },\
        \"ValidTo\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time at which the imported key material expires. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. You must omit this parameter when the <code>ExpirationModel</code> parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>. Otherwise it is required.</p>\"\
        },\
        \"ExpirationModel\":{\
          \"shape\":\"ExpirationModelType\",\
          \"documentation\":\"<p>Specifies whether the key material expires. The default is <code>KEY_MATERIAL_EXPIRES</code>, in which case you must include the <code>ValidTo</code> parameter. When this parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>, you must omit the <code>ValidTo</code> parameter.</p>\"\
        }\
      }\
    },\
    \"ImportKeyMaterialResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"IncorrectKeyMaterialException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the provided key material is invalid or is not the same key material that was previously imported into this customer master key (CMK).</p>\",\
      \"exception\":true\
    },\
    \"InvalidAliasNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified alias name is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidArnException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because a specified ARN was not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidCiphertextException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified ciphertext, or additional authenticated data incorporated into the ciphertext, such as the encryption context, is corrupted, missing, or otherwise invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidGrantIdException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified <code>GrantId</code> is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidGrantTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified grant token is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidImportTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the provided import token is invalid or is associated with a different customer master key (CMK).</p>\",\
      \"exception\":true\
    },\
    \"InvalidKeyUsageException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified <code>KeySpec</code> value is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidMarkerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the marker that specifies where pagination should next begin is not valid.</p>\",\
      \"exception\":true\
    },\
    \"KMSInternalException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because an internal exception occurred. The request can be retried.</p>\",\
      \"exception\":true\
    },\
    \"KMSInvalidStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the state of the specified resource is not valid for this request.</p> <p>For more information about how key state affects the use of a CMK, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">How Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\",\
      \"exception\":true\
    },\
    \"KeyIdType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"KeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyListEntry\"}\
    },\
    \"KeyListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Unique identifier of the key.</p>\"\
        },\
        \"KeyArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>ARN of the key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about each entry in the key list.</p>\"\
    },\
    \"KeyManagerType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS\",\
        \"CUSTOMER\"\
      ]\
    },\
    \"KeyMetadata\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"AWSAccountId\":{\
          \"shape\":\"AWSAccountIdType\",\
          \"documentation\":\"<p>The twelve-digit account ID of the AWS account that owns the CMK.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The globally unique identifier for the CMK.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the CMK. For examples, see <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms\\\">AWS Key Management Service (AWS KMS)</a> in the Example ARNs section of the <i>AWS General Reference</i>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time when the CMK was created.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the CMK is enabled. When <code>KeyState</code> is <code>Enabled</code> this value is true, otherwise it is false.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>The description of the CMK.</p>\"\
        },\
        \"KeyUsage\":{\
          \"shape\":\"KeyUsageType\",\
          \"documentation\":\"<p>The cryptographic operations for which you can use the CMK. Currently the only allowed value is <code>ENCRYPT_DECRYPT</code>, which means you can use the CMK for the <a>Encrypt</a> and <a>Decrypt</a> operations.</p>\"\
        },\
        \"KeyState\":{\
          \"shape\":\"KeyState\",\
          \"documentation\":\"<p>The state of the CMK.</p> <p>For more information about how key state affects the use of a CMK, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">How Key State Affects the Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time after which AWS KMS deletes the CMK. This value is present only when <code>KeyState</code> is <code>PendingDeletion</code>, otherwise this value is omitted.</p>\"\
        },\
        \"ValidTo\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time at which the imported key material expires. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. This value is present only for CMKs whose <code>Origin</code> is <code>EXTERNAL</code> and whose <code>ExpirationModel</code> is <code>KEY_MATERIAL_EXPIRES</code>, otherwise this value is omitted.</p>\"\
        },\
        \"Origin\":{\
          \"shape\":\"OriginType\",\
          \"documentation\":\"<p>The source of the CMK's key material. When this value is <code>AWS_KMS</code>, AWS KMS created the key material. When this value is <code>EXTERNAL</code>, the key material was imported from your existing key management infrastructure or the CMK lacks key material.</p>\"\
        },\
        \"ExpirationModel\":{\
          \"shape\":\"ExpirationModelType\",\
          \"documentation\":\"<p>Specifies whether the CMK's key material expires. This value is present only when <code>Origin</code> is <code>EXTERNAL</code>, otherwise this value is omitted.</p>\"\
        },\
        \"KeyManager\":{\
          \"shape\":\"KeyManagerType\",\
          \"documentation\":\"<p>The CMK's manager. CMKs are either customer-managed or AWS-managed. For more information about the difference, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys\\\">Customer Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a customer master key (CMK).</p> <p>This data type is used as a response element for the <a>CreateKey</a> and <a>DescribeKey</a> operations.</p>\"\
    },\
    \"KeyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\",\
        \"PendingDeletion\",\
        \"PendingImport\"\
      ]\
    },\
    \"KeyUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified CMK was not available. The request can be retried.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"KeyUsageType\":{\
      \"type\":\"string\",\
      \"enum\":[\"ENCRYPT_DECRYPT\"]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because a limit was exceeded. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/limits.html\\\">Limits</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\",\
      \"exception\":true\
    },\
    \"LimitType\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"ListAliasesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Aliases\":{\
          \"shape\":\"AliasList\",\
          \"documentation\":\"<p>A list of aliases.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListGrantsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To specify a CMK in a different AWS account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"ListGrantsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Grants\":{\
          \"shape\":\"GrantList\",\
          \"documentation\":\"<p>A list of grants.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListKeyPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p> <p>Currently only 1 policy can be attached to a key.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListKeyPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNameList\",\
          \"documentation\":\"<p>A list of key policy names. Currently, there is only one key policy per CMK and it is always named <code>default</code>.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListKeysRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListKeysResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Keys\":{\
          \"shape\":\"KeyList\",\
          \"documentation\":\"<p>A list of customer master keys (CMKs).</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListResourceTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p> <p>Do not attempt to construct this value. Use only the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListResourceTagsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags. Each tag consists of a tag key and a tag value.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p> <p>Do not assume or infer any information from this value.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListRetirableGrantsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RetiringPrincipal\"],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        },\
        \"RetiringPrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The retiring principal for which to list grants.</p> <p>To specify the retiring principal, use the <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include AWS accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax for specifying a principal, see <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam\\\">AWS Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p>\"\
        }\
      }\
    },\
    \"MalformedPolicyDocumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified policy is not syntactically or semantically correct.</p>\",\
      \"exception\":true\
    },\
    \"MarkerType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]*\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified entity or resource could not be found.</p>\",\
      \"exception\":true\
    },\
    \"NumberOfBytesType\":{\
      \"type\":\"integer\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"OriginType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS_KMS\",\
        \"EXTERNAL\"\
      ]\
    },\
    \"PendingWindowInDaysType\":{\
      \"type\":\"integer\",\
      \"max\":365,\
      \"min\":1\
    },\
    \"PlaintextType\":{\
      \"type\":\"blob\",\
      \"max\":4096,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"PolicyNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyNameType\"}\
    },\
    \"PolicyNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w]+\"\
    },\
    \"PolicyType\":{\
      \"type\":\"string\",\
      \"max\":131072,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u00FF]+\"\
    },\
    \"PrincipalIdType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"PutKeyPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"PolicyName\",\
        \"Policy\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyNameType\",\
          \"documentation\":\"<p>The name of the key policy. The only valid value is <code>default</code>.</p>\"\
        },\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The key policy to attach to the CMK.</p> <p>The key policy must meet the following criteria:</p> <ul> <li> <p>If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the key policy must allow the principal that is making the <code>PutKeyPolicy</code> request to make a subsequent <code>PutKeyPolicy</code> request on the CMK. This reduces the risk that the CMK becomes unmanageable. For more information, refer to the scenario in the <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam\\\">Default Key Policy</a> section of the <i>AWS Key Management Service Developer Guide</i>.</p> </li> <li> <p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to AWS KMS. When you create a new AWS principal (for example, an IAM user or role), you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to AWS KMS. For more information, see <a href=\\\"http://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency\\\">Changes that I make are not always immediately visible</a> in the <i>AWS Identity and Access Management User Guide</i>.</p> </li> </ul> <p>The key policy size limit is 32 kilobytes (32768 bytes).</p>\"\
        },\
        \"BypassPolicyLockoutSafetyCheck\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag to indicate whether to bypass the key policy lockout safety check.</p> <important> <p>Setting this value to true increases the risk that the CMK becomes unmanageable. Do not set this value to true indiscriminately.</p> <p>For more information, refer to the scenario in the <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam\\\">Default Key Policy</a> section in the <i>AWS Key Management Service Developer Guide</i>.</p> </important> <p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <code>PutKeyPolicy</code> request on the CMK.</p> <p>The default value is false.</p>\"\
        }\
      }\
    },\
    \"ReEncryptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CiphertextBlob\",\
        \"DestinationKeyId\"\
      ],\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>Ciphertext of the data to reencrypt.</p>\"\
        },\
        \"SourceEncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Encryption context used to encrypt and decrypt the data specified in the <code>CiphertextBlob</code> parameter.</p>\"\
        },\
        \"DestinationKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the CMK that is used to reencrypt the data.</p> <p>To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. When using an alias name, prefix it with \\\"alias/\\\". To specify a CMK in a different AWS account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"DestinationEncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Encryption context to use when the data is reencrypted.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token\\\">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"ReEncryptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The reencrypted data. When you use the HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not encoded.</p>\"\
        },\
        \"SourceKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Unique identifier of the CMK used to originally encrypt the data.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Unique identifier of the CMK used to reencrypt the data.</p>\"\
        }\
      }\
    },\
    \"RetireGrantRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GrantToken\":{\
          \"shape\":\"GrantTokenType\",\
          \"documentation\":\"<p>Token that identifies the grant to be retired.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the CMK associated with the grant. </p> <p>For example: <code>arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>Unique identifier of the grant to retire. The grant ID is returned in the response to a <code>CreateGrant</code> operation.</p> <ul> <li> <p>Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123</p> </li> </ul>\"\
        }\
      }\
    },\
    \"RevokeGrantRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"GrantId\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key associated with the grant.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To specify a CMK in a different AWS account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>Identifier of the grant to be revoked.</p>\"\
        }\
      }\
    },\
    \"ScheduleKeyDeletionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier of the customer master key (CMK) to delete.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PendingWindowInDays\":{\
          \"shape\":\"PendingWindowInDaysType\",\
          \"documentation\":\"<p>The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the customer master key (CMK).</p> <p>This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30.</p>\"\
        }\
      }\
    },\
    \"ScheduleKeyDeletionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier of the customer master key (CMK) for which deletion is scheduled.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time after which AWS KMS deletes the customer master key (CMK).</p>\"\
        }\
      }\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TagKey\",\
        \"TagValue\"\
      ],\
      \"members\":{\
        \"TagKey\":{\
          \"shape\":\"TagKeyType\",\
          \"documentation\":\"<p>The key of the tag.</p>\"\
        },\
        \"TagValue\":{\
          \"shape\":\"TagValueType\",\
          \"documentation\":\"<p>The value of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p> <p>For information about the rules that apply to tag keys and tag values, see <a href=\\\"http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html\\\">User-Defined Tag Restrictions</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
    },\
    \"TagException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because one or more tags are not valid.</p>\",\
      \"exception\":true\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKeyType\"}\
    },\
    \"TagKeyType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the CMK you are tagging.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags. Each tag consists of a tag key and a tag value.</p>\"\
        }\
      }\
    },\
    \"TagValueType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"UnsupportedOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.</p>\",\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the CMK from which you are removing tags.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>One or more tag keys. Specify only the tag keys, not the tag values.</p>\"\
        }\
      }\
    },\
    \"UpdateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AliasName\",\
        \"TargetKeyId\"\
      ],\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>String that contains the name of the alias to be modified. The name must start with the word \\\"alias\\\" followed by a forward slash (alias/). Aliases that begin with \\\"alias/aws\\\" are reserved.</p>\"\
        },\
        \"TargetKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Unique identifier of the customer master key to be mapped to the alias.</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p> <p>To verify that the alias is mapped to the correct CMK, use <a>ListAliases</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateKeyDescriptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the customer master key (CMK).</p> <p>Specify the key ID or the Amazon Resource Name (ARN) of the CMK.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>New description for the CMK.</p>\"\
        }\
      }\
    },\
    \"WrappingKeySpec\":{\
      \"type\":\"string\",\
      \"enum\":[\"RSA_2048\"]\
    }\
  },\
  \"documentation\":\"<fullname>AWS Key Management Service</fullname> <p>AWS Key Management Service (AWS KMS) is an encryption and key management web service. This guide describes the AWS KMS operations that you can call programmatically. For general information about AWS KMS, see the <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/\\\">AWS Key Management Service Developer Guide</a>.</p> <note> <p>AWS provides SDKs that consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .Net, iOS, Android, etc.). The SDKs provide a convenient way to create programmatic access to AWS KMS and other AWS services. For example, the SDKs take care of tasks such as signing requests (see below), managing errors, and retrying requests automatically. For more information about the AWS SDKs, including how to download and install them, see <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>.</p> </note> <p>We recommend that you use the AWS SDKs to make programmatic API calls to AWS KMS.</p> <p>Clients must support TLS (Transport Layer Security) 1.0. We recommend TLS 1.2. Clients must also support cipher suites with Perfect Forward Secrecy (PFS) such as Ephemeral Diffie-Hellman (DHE) or Elliptic Curve Ephemeral Diffie-Hellman (ECDHE). Most modern systems such as Java 7 and later support these modes.</p> <p> <b>Signing Requests</b> </p> <p>Requests must be signed by using an access key ID and a secret access key. We strongly recommend that you <i>do not</i> use your AWS account (root) access key ID and secret key for everyday work with AWS KMS. Instead, use the access key ID and secret access key for an IAM user, or you can use the AWS Security Token Service to generate temporary security credentials that you can use to sign requests.</p> <p>All AWS KMS operations require <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4</a>.</p> <p> <b>Logging API Requests</b> </p> <p>AWS KMS supports AWS CloudTrail, a service that logs AWS API calls and related events for your AWS account and delivers them to an Amazon S3 bucket that you specify. By using the information collected by CloudTrail, you can determine what requests were made to AWS KMS, who made the request, when it was made, and so on. To learn more about CloudTrail, including how to turn it on and find your log files, see the <a href=\\\"http://docs.aws.amazon.com/awscloudtrail/latest/userguide/\\\">AWS CloudTrail User Guide</a>.</p> <p> <b>Additional Resources</b> </p> <p>For more information about credentials and request signing, see the following:</p> <ul> <li> <p> <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html\\\">AWS Security Credentials</a> - This topic provides general information about the types of credentials used for accessing AWS.</p> </li> <li> <p> <a href=\\\"http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html\\\">Temporary Security Credentials</a> - This section of the <i>IAM User Guide</i> describes how to create and use temporary security credentials.</p> </li> <li> <p> <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 Signing Process</a> - This set of topics walks you through the process of signing a request using an access key ID and a secret access key.</p> </li> </ul> <p> <b>Commonly Used APIs</b> </p> <p>Of the APIs discussed in this guide, the following will prove the most useful for most applications. You will likely perform actions other than these, such as creating keys and assigning policies, by using the console.</p> <ul> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> </ul>\"\
}\
";
}

@end
