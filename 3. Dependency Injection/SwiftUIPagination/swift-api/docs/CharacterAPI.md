# CharacterAPI

All URIs are relative to *https://rickandmortyapi.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**charactersGet**](CharacterAPI.md#charactersget) | **GET** /character/ | Character list


# **charactersGet**
```swift
    open class func charactersGet(page: Int? = nil, name: String? = nil, status: LivingStatus? = nil, gender: Gender? = nil, completion: @escaping (_ data: CharacterList?, _ error: Error?) -> Void)
```

Character list

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let page = 987 // Int | The page number of objects to return. Defaults to 0. (optional)
let name = "name_example" // String | Chracter name. (optional)
let status = LivingStatus() // LivingStatus | Character status. (optional)
let gender = Gender() // Gender | Character gender. (optional)

// Character list
CharacterAPI.charactersGet(page: page, name: name, status: status, gender: gender) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Int** | The page number of objects to return. Defaults to 0. | [optional] 
 **name** | **String** | Chracter name. | [optional] 
 **status** | [**LivingStatus**](.md) | Character status. | [optional] 
 **gender** | [**Gender**](.md) | Character gender. | [optional] 

### Return type

[**CharacterList**](CharacterList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

