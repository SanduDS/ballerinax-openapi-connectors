// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [selz API v1.0](https://developer.selz.com/api/reference) OpenAPI specification.
# The Selz API is organized around REST. Our API has predictable
# resource-oriented URLs, accepts form-encoded request bodies, returns
# JSON-encoded responses, and uses standard HTTP response codes,
# authentication, and verbs.
@display {label: "Selz", iconPath: "resources/selz.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [selz account](https://selz.com) and obtain tokens by following [this guide](https://developer.selz.com/api/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # List all blog posts
    #
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getBlogposts(int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsBlogpostsBlogpostresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/blog/posts`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsBlogpostsBlogpostresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsBlogpostsBlogpostresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Create a blog post
    #
    # + payload - Create blogposts request 
    # + return - Success 
    remote isolated function createBlogposts(SelzApiPublicModelsBlogpostsBlogpostrequest payload) returns SelzApiPublicModelsBlogpostsBlogpostresponse|error {
        string  path = string `/blog/posts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsBlogpostsBlogpostresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsBlogpostsBlogpostresponse);
        return response;
    }
    # Retrieve a blog post
    #
    # + id - The identifier of the blog post to be retrieved. 
    # + return - Success 
    remote isolated function retrieveBlogposts(string id) returns SelzApiPublicModelsBlogpostsBlogpostresponse|error {
        string  path = string `/blog/posts/${id}`;
        SelzApiPublicModelsBlogpostsBlogpostresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsBlogpostsBlogpostresponse);
        return response;
    }
    # Update a blog post
    #
    # + id - The identifier of the blog post to be updated. 
    # + payload - The fields to update 
    # + return - Success 
    remote isolated function updateBlogposts(string id, SelzApiPublicModelsBlogpostsBlogpostputrequest payload) returns SelzApiPublicModelsBlogpostsBlogpostresponse|error {
        string  path = string `/blog/posts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsBlogpostsBlogpostresponse response = check self.clientEp->put(path, request, targetType=SelzApiPublicModelsBlogpostsBlogpostresponse);
        return response;
    }
    # Delete a blog post
    #
    # + id - The identifier of the blog post to be deleted. 
    # + return - Success 
    remote isolated function deleteBlogposts(string id) returns http:Response|error {
        string  path = string `/blog/posts/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Add blog post hero image
    #
    # + id - The identifier of the blog post. 
    # + payload - Add blog post hero image request 
    # + return - Success 
    remote isolated function addimageBlogposts(string id, SelzApiPublicModelsBlogpostsAddimagerequest payload) returns SelzApiPublicModelsBlogpostsAddimageresponse|error {
        string  path = string `/blog/posts/${id}/image`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsBlogpostsAddimageresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsBlogpostsAddimageresponse);
        return response;
    }
    # Remove blog post hero image
    #
    # + id - The identifier of the blog post. 
    # + return - Success 
    remote isolated function removeimageBlogposts(string id) returns http:Response|error {
        string  path = string `/blog/posts/${id}/image`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List all categories
    #
    # + productId - Only return orders that contain a product with the given product id. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getCategories(string? productId = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/categories`;
        map<anydata> queryParam = {"product_id": productId, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Create a category
    #
    # + payload - Create a category request 
    # + return - Success 
    remote isolated function createCategories(SelzApiPublicModelsCategoriesCategoryrequest payload) returns SelzApiPublicModelsCategoriesCategoryresponse|error {
        string  path = string `/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsCategoriesCategoryresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsCategoriesCategoryresponse);
        return response;
    }
    # Retrieve a category
    #
    # + id - The identifier of the category to be retrieved. 
    # + return - Success 
    remote isolated function retrieveCategories(string id) returns SelzApiPublicModelsCategoriesCategoryresponse|error {
        string  path = string `/categories/${id}`;
        SelzApiPublicModelsCategoriesCategoryresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsCategoriesCategoryresponse);
        return response;
    }
    # Update a category
    #
    # + id - The identifier of the category to be updated. 
    # + payload - The fields to update 
    # + return - Success 
    remote isolated function updateCategories(string id, SelzApiPublicModelsCategoriesCategoryputrequest payload) returns SelzApiPublicModelsCategoriesCategoryresponse|error {
        string  path = string `/categories/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsCategoriesCategoryresponse response = check self.clientEp->put(path, request, targetType=SelzApiPublicModelsCategoriesCategoryresponse);
        return response;
    }
    # Delete a category
    #
    # + id - The identifier of the category to be deleted. 
    # + return - Success 
    remote isolated function deleteCategories(string id) returns http:Response|error {
        string  path = string `/categories/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List all customers
    #
    # + email - Filter by customer email 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getCustomers(string? email = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsCustomersCustomerresponse|error {
        string  path = string `/customers`;
        map<anydata> queryParam = {"email": email, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsCustomersCustomerresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsCustomersCustomerresponse);
        return response;
    }
    # Create a customer
    #
    # + payload - Customer to be created 
    # + return - Success 
    remote isolated function createCustomers(SelzApiPublicModelsCustomersCustomerrequest payload) returns SelzApiPublicModelsCustomersCustomerresponse|error {
        string  path = string `/customers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsCustomersCustomerresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsCustomersCustomerresponse);
        return response;
    }
    # Retrieve a customer
    #
    # + id - The identifier of the customer to be retrieved. 
    # + return - Success 
    remote isolated function retrieveCustomers(string id) returns SelzApiPublicModelsCustomersCustomerresponse|error {
        string  path = string `/customers/${id}`;
        SelzApiPublicModelsCustomersCustomerresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsCustomersCustomerresponse);
        return response;
    }
    # Update a customer
    #
    # + id - The identifier of the customer to be updated. 
    # + payload - The fields to update 
    # + return - Success 
    remote isolated function updateCustomers(string id, SelzApiPublicModelsCustomersCustomerputrequest payload) returns SelzApiPublicModelsCustomersCustomerresponse|error {
        string  path = string `/customers/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsCustomersCustomerresponse response = check self.clientEp->put(path, request, targetType=SelzApiPublicModelsCustomersCustomerresponse);
        return response;
    }
    # Delete a customer
    #
    # + id - The identifier of the customer to be deleted. 
    # + return - Success 
    remote isolated function deleteCustomers(string id) returns http:Response|error {
        string  path = string `/customers/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Retrieve a customer by email
    #
    # + email - email of the customer 
    # + return - Success 
    remote isolated function getCustomersByemail(string email) returns SelzApiPublicModelsCustomersCustomerresponse|error {
        string  path = string `/customers/email/${email}`;
        SelzApiPublicModelsCustomersCustomerresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsCustomersCustomerresponse);
        return response;
    }
    # List all discounts
    #
    # + discountCode - Filter by the case-insensitive discount code. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getDiscounts(string? discountCode = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDiscountsDiscountresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/discounts`;
        map<anydata> queryParam = {"discount_code": discountCode, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDiscountsDiscountresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDiscountsDiscountresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Create a discount
    #
    # + payload - Create a discount request 
    # + return - Success 
    remote isolated function createDiscounts(SelzApiPublicModelsDiscountsDiscountrequest payload) returns SelzApiPublicModelsDiscountsDiscountresponse|error {
        string  path = string `/discounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsDiscountsDiscountresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsDiscountsDiscountresponse);
        return response;
    }
    # Retrieve a discount
    #
    # + id - The identifier of the discount to be retrieved. 
    # + return - Success 
    remote isolated function retrieveDiscounts(string id) returns SelzApiPublicModelsDiscountsDiscountresponse|error {
        string  path = string `/discounts/${id}`;
        SelzApiPublicModelsDiscountsDiscountresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsDiscountsDiscountresponse);
        return response;
    }
    # Update a discount
    #
    # + id - The identifier of the discount to be updated. 
    # + payload - The fields to update 
    # + return - Success 
    remote isolated function updateDiscounts(string id, SelzApiPublicModelsDiscountsDiscountputrequest payload) returns SelzApiPublicModelsDiscountsDiscountresponse|error {
        string  path = string `/discounts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsDiscountsDiscountresponse response = check self.clientEp->put(path, request, targetType=SelzApiPublicModelsDiscountsDiscountresponse);
        return response;
    }
    # Delete a discount
    #
    # + id - The identifier of the discount to be deleted. 
    # + return - Success 
    remote isolated function deleteDiscounts(string id) returns http:Response|error {
        string  path = string `/discounts/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List Disputes
    #
    # + status - Filter by the case-insensitive dispute status. Value Can be one of NeedsResponse, UnderReview, CannotRespond, Closed, Refunded, Won, Lost 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getDisputes(string? status = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDisputesDisputeresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/disputes`;
        map<anydata> queryParam = {"status": status, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDisputesDisputeresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDisputesDisputeresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Retrieve a dispute
    #
    # + id - The identifier of the dispute to be retrieved. 
    # + return - Success 
    remote isolated function retrieveDisputes(string id) returns SelzApiPublicModelsDisputesDisputeresponse|error {
        string  path = string `/disputes/${id}`;
        SelzApiPublicModelsDisputesDisputeresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsDisputesDisputeresponse);
        return response;
    }
    # List all Orders
    #
    # + customerEmail - A filter on the list based on the customer’s email field. The value must be a string. 
    # + orderStatus - Only return orders that have the given status. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getOrders(string? customerEmail = (), string? orderStatus = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsOrdersOrderresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/orders`;
        map<anydata> queryParam = {"customer_email": customerEmail, "order_status": orderStatus, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsOrdersOrderresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsOrdersOrderresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Retrieve an Order
    #
    # + id - The identifier of the Order to be retrieved. 
    # + return - Success 
    remote isolated function retrieveOrders(string id) returns SelzApiPublicModelsOrdersOrderresponse|error {
        string  path = string `/orders/${id}`;
        SelzApiPublicModelsOrdersOrderresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsOrdersOrderresponse);
        return response;
    }
    # Update an order to complete status
    #
    # + id - The identifier of the order to be updated. 
    # + return - Success 
    remote isolated function completeOrders(string id) returns SelzApiPublicModelsOrdersOrderresponse|error {
        string  path = string `/orders/${id}/complete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        SelzApiPublicModelsOrdersOrderresponse response = check self.clientEp-> put(path, request, targetType = SelzApiPublicModelsOrdersOrderresponse);
        return response;
    }
    # List Payouts
    #
    # + return - Success 
    remote isolated function getPayouts() returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsPayoutsPayoutresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/payouts`;
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsPayoutsPayoutresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsPayoutsPayoutresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Retrieve a payout
    #
    # + id - The identifier of the payout to be retrieved. 
    # + return - Success 
    remote isolated function retrievePayouts(string id) returns SelzApiPublicModelsPayoutsPayoutresponse|error {
        string  path = string `/payouts/${id}`;
        SelzApiPublicModelsPayoutsPayoutresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsPayoutsPayoutresponse);
        return response;
    }
    # List all products
    #
    # + productType - Filter by Product Type 
    # + isPublished - Filter by IsPublished 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function findProducts(string? productType = (), boolean? isPublished = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsProductsProductresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/products`;
        map<anydata> queryParam = {"product_type": productType, "is_published": isPublished, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsProductsProductresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsProductsProductresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Create a product
    #
    # + payload - Create a product request 
    # + return - Success 
    remote isolated function createProducts(SelzApiPublicModelsProductsProductrequest payload) returns SelzApiPublicModelsProductsProductresponse|error {
        string  path = string `/products`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsProductresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsProductsProductresponse);
        return response;
    }
    # Retrieve a product
    #
    # + id - The identifier of the product to be retrieved. 
    # + return - Success 
    remote isolated function retrieveProducts(string id) returns SelzApiPublicModelsProductsProductresponse|error {
        string  path = string `/products/${id}`;
        SelzApiPublicModelsProductsProductresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsProductsProductresponse);
        return response;
    }
    # Update a product
    #
    # + id - The identifier of the product to be updated. 
    # + payload - The fields to update 
    # + return - Success 
    remote isolated function productsUpdate(string id, SelzApiPublicModelsProductsProductputrequest payload) returns SelzApiPublicModelsProductsProductresponse|error {
        string  path = string `/products/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsProductresponse response = check self.clientEp->put(path, request, targetType=SelzApiPublicModelsProductsProductresponse);
        return response;
    }
    # Delete a product
    #
    # + id - The identifier of the product to be deleted. 
    # + return - Success 
    remote isolated function deleteProducts(string id) returns http:Response|error {
        string  path = string `/products/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List categories
    #
    # + id - ID 
    # + productId - Only return categories that contain this product id 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getProductsCategories(string id, string? productId = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/products/${id}/categories`;
        map<anydata> queryParam = {"product_id": productId, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Assign to category
    #
    # + id - the product id 
    # + payload - Assign to category request 
    # + return - Success 
    remote isolated function addProductToCategory(string id, SelzApiPublicModelsProductsAddproducttocategoryrequest payload) returns SelzApiPublicModelsProductsAddproducttocategoryresponse|error {
        string  path = string `/products/${id}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsAddproducttocategoryresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsProductsAddproducttocategoryresponse);
        return response;
    }
    # Remove from category
    #
    # + productId - the product id 
    # + categoryId - the category id 
    # + return - Success 
    remote isolated function removeProductFromCategory(string productId, string categoryId) returns http:Response|error {
        string  path = string `/products/${productId}/categories/${categoryId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Verify a license key
    #
    # + id - the product id 
    # + payload - Verify a license key request 
    # + return - Success 
    remote isolated function verifyProductsLicense(string id, SelzApiPublicModelsProductsLicenseverifyrequest payload) returns SelzApiPublicModelsProductsLicenseverifyresponse|error {
        string  path = string `/products/${id}/licenses/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsLicenseverifyresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsProductsLicenseverifyresponse);
        return response;
    }
    # Add product image
    #
    # + id - The identifier of the product. 
    # + payload - Add product image request 
    # + return - Success 
    remote isolated function addProductsImage(string id, SelzApiPublicModelsProductsAddimagerequest payload) returns SelzApiPublicModelsProductsAddimageresponse|error {
        string  path = string `/products/${id}/image`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsAddimageresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsProductsAddimageresponse);
        return response;
    }
    # Remove product images
    #
    # + id - The identifier of the product. 
    # + return - Success 
    remote isolated function removeAllProductsImages(string id) returns http:Response|error {
        string  path = string `/products/${id}/images`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Adds new variant to a product
    #
    # + id - the product id 
    # + payload - Adds new variant to a product request 
    # + return - Success 
    remote isolated function addProductVariant(string id, SelzApiPublicModelsProductsProductvariantrequest payload) returns SelzApiPublicModelsProductsProductvariantresponse|error {
        string  path = string `/products/${id}/variants`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsProductvariantresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsProductsProductvariantresponse);
        return response;
    }
    # Update product variant
    #
    # + id - The identifier of the product to be updated. 
    # + variantId - The identifier of the variant to be updated. 
    # + payload - The fields of the variant to update 
    # + return - Success 
    remote isolated function updateProductVariant(string id, string variantId, SelzApiPublicModelsProductsProductvariantputrequest payload) returns SelzApiPublicModelsProductsProductvariantresponse|error {
        string  path = string `/products/${id}/variants/${variantId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsProductsProductvariantresponse response = check self.clientEp->put(path, request, targetType=SelzApiPublicModelsProductsProductvariantresponse);
        return response;
    }
    # Deletes existing variant from a product
    #
    # + id - the product id 
    # + variantId - the variant id 
    # + return - Success 
    remote isolated function deleteProductVariant(string id, string variantId) returns http:Response|error {
        string  path = string `/products/${id}/variants/${variantId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List all refunds
    #
    # + status - Filter by refund status 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function findRefunds(string? status = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzOrdersApiModelsRefundresponseSelzOrdersApiModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/refunds`;
        map<anydata> queryParam = {"status": status, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzOrdersApiModelsRefundresponseSelzOrdersApiModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzOrdersApiModelsRefundresponseSelzOrdersApiModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Retrieve a refund
    #
    # + id - the identifier of the refund to be retrieved 
    # + return - Success 
    remote isolated function retrieveRefunds(string id) returns SelzApiPublicModelsRefundsRefundresponse|error {
        string  path = string `/refunds/${id}`;
        SelzApiPublicModelsRefundsRefundresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsRefundsRefundresponse);
        return response;
    }
    # Retrieve store details
    #
    # + return - Success 
    remote isolated function retrieveStore() returns SelzApiPublicModelsStoreStoreresponse|error {
        string  path = string `/store`;
        SelzApiPublicModelsStoreStoreresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsStoreStoreresponse);
        return response;
    }
    # List all webhooks
    #
    # + eventType - A filter on the list based on the webhook event type 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100 items. (default is 10) 
    # + startingAfter - A cursor for use in pagination. starting_after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include starting_after=obj_foo in order to fetch the next page of the list. 
    # + endingBefore - A cursor for use in pagination. ending_before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_bar, your subsequent call can include ending_before=obj_bar in order to fetch the previous page of the list. 
    # + createdDateMin - Filter by minimum created date 
    # + createdDateMax - Filter by maximum created date 
    # + updatedDateMin - Filter by minimum updated date. 
    # + updatedDateMax - Filter by maximum updated date. 
    # + return - Success 
    remote isolated function getWebhooks(string? eventType = (), int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? createdDateMin = (), string? createdDateMax = (), string? updatedDateMin = (), string? updatedDateMax = ()) returns SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsWebhooksWebhookresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"event_type": eventType, "limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "created_date_min": createdDateMin, "created_date_max": createdDateMax, "updated_date_min": updatedDateMin, "updated_date_max": updatedDateMax};
        path = path + check getPathForQueryParam(queryParam);
        SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsWebhooksWebhookresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsWebhooksWebhookresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull);
        return response;
    }
    # Create a webhook
    #
    # + payload - Create a webhook request 
    # + return - Success 
    remote isolated function createWebhooks(SelzApiPublicModelsWebhooksWebhookrequest payload) returns SelzApiPublicModelsWebhooksWebhookresponse|error {
        string  path = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SelzApiPublicModelsWebhooksWebhookresponse response = check self.clientEp->post(path, request, targetType=SelzApiPublicModelsWebhooksWebhookresponse);
        return response;
    }
    # Retrieve a webhook
    #
    # + id - The identifier of the webhook to be retrieved. 
    # + return - Success 
    remote isolated function retrieveWebhooks(string id) returns SelzApiPublicModelsWebhooksWebhookresponse|error {
        string  path = string `/webhooks/${id}`;
        SelzApiPublicModelsWebhooksWebhookresponse response = check self.clientEp-> get(path, targetType = SelzApiPublicModelsWebhooksWebhookresponse);
        return response;
    }
    # Update a webhook
    #
    # + id - The identifier of the webhook to be updated. 
    # + payload - The fields to update 
    # + return - Success 
    remote isolated function putWebhooks(string id, SelzApiPublicModelsWebhooksWebhookputrequest payload) returns http:Response|error {
        string  path = string `/webhooks/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a webhook
    #
    # + id - The identifier of the webhook to be deleted. 
    # + return - Success 
    remote isolated function deleteWebhooks(string id) returns http:Response|error {
        string  path = string `/webhooks/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
