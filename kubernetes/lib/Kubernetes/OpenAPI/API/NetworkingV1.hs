{-
   Kubernetes

   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   OpenAPI Version: 3.0.1
   Kubernetes API version: v1.9.12
   Generated by OpenAPI Generator (https://openapi-generator.tech)
-}

{-|
Module : Kubernetes.OpenAPI.API.NetworkingV1
-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module Kubernetes.OpenAPI.API.NetworkingV1 where

import Kubernetes.OpenAPI.Core
import Kubernetes.OpenAPI.MimeTypes
import Kubernetes.OpenAPI.Model as M

import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Data as P (Typeable, TypeRep, typeOf, typeRep)
import qualified Data.Foldable as P
import qualified Data.Map as Map
import qualified Data.Maybe as P
import qualified Data.Proxy as P (Proxy(..))
import qualified Data.Set as Set
import qualified Data.String as P
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL
import qualified Data.Time as TI
import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media as ME
import qualified Network.HTTP.Types as NH
import qualified Web.FormUrlEncoded as WH
import qualified Web.HttpApiData as WH

import Data.Text (Text)
import GHC.Base ((<|>))

import Prelude ((==),(/=),($), (.),(<$>),(<*>),(>>=),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)
import qualified Prelude as P

-- * Operations


-- ** NetworkingV1

-- *** createNamespacedNetworkPolicy

-- | @POST \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies@
-- 
-- create a NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
createNamespacedNetworkPolicy 
  :: (Consumes CreateNamespacedNetworkPolicy contentType, MimeRender contentType V1NetworkPolicy)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1NetworkPolicy -- ^ "body"
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest CreateNamespacedNetworkPolicy contentType V1NetworkPolicy accept
createNamespacedNetworkPolicy _  _ body (Namespace namespace) =
  _mkRequest "POST" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data CreateNamespacedNetworkPolicy 
instance HasBodyParam CreateNamespacedNetworkPolicy V1NetworkPolicy 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam CreateNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes CreateNamespacedNetworkPolicy mtype

-- | @application/json@
instance Produces CreateNamespacedNetworkPolicy MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces CreateNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces CreateNamespacedNetworkPolicy MimeYaml


-- *** deleteCollectionNamespacedNetworkPolicy

-- | @DELETE \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies@
-- 
-- delete collection of NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteCollectionNamespacedNetworkPolicy 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteCollectionNamespacedNetworkPolicy MimeNoContent V1Status accept
deleteCollectionNamespacedNetworkPolicy  _ (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data DeleteCollectionNamespacedNetworkPolicy  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam DeleteCollectionNamespacedNetworkPolicy Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces DeleteCollectionNamespacedNetworkPolicy MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteCollectionNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces DeleteCollectionNamespacedNetworkPolicy MimeYaml


-- *** deleteNamespacedNetworkPolicy

-- | @DELETE \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies\/{name}@
-- 
-- delete a NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteNamespacedNetworkPolicy 
  :: (Consumes DeleteNamespacedNetworkPolicy contentType, MimeRender contentType V1DeleteOptions)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1DeleteOptions -- ^ "body"
  -> Name -- ^ "name" -  name of the NetworkPolicy
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteNamespacedNetworkPolicy contentType V1Status accept
deleteNamespacedNetworkPolicy _  _ body (Name name) (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data DeleteNamespacedNetworkPolicy 
instance HasBodyParam DeleteNamespacedNetworkPolicy V1DeleteOptions 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "gracePeriodSeconds" - The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
instance HasOptionalParam DeleteNamespacedNetworkPolicy GracePeriodSeconds where
  applyOptionalParam req (GracePeriodSeconds xs) =
    req `setQuery` toQuery ("gracePeriodSeconds", Just xs)

-- | /Optional Param/ "orphanDependents" - Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
instance HasOptionalParam DeleteNamespacedNetworkPolicy OrphanDependents where
  applyOptionalParam req (OrphanDependents xs) =
    req `setQuery` toQuery ("orphanDependents", Just xs)

-- | /Optional Param/ "propagationPolicy" - Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
instance HasOptionalParam DeleteNamespacedNetworkPolicy PropagationPolicy where
  applyOptionalParam req (PropagationPolicy xs) =
    req `setQuery` toQuery ("propagationPolicy", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes DeleteNamespacedNetworkPolicy mtype

-- | @application/json@
instance Produces DeleteNamespacedNetworkPolicy MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces DeleteNamespacedNetworkPolicy MimeYaml


-- *** getAPIResources

-- | @GET \/apis\/networking.k8s.io\/v1\/@
-- 
-- get available resources
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
getAPIResources 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest GetAPIResources MimeNoContent V1APIResourceList accept
getAPIResources  _ =
  _mkRequest "GET" ["/apis/networking.k8s.io/v1/"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data GetAPIResources  
-- | @application/json@
instance Produces GetAPIResources MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces GetAPIResources MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces GetAPIResources MimeYaml


-- *** listNamespacedNetworkPolicy

-- | @GET \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies@
-- 
-- list or watch objects of kind NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listNamespacedNetworkPolicy 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ListNamespacedNetworkPolicy MimeNoContent V1NetworkPolicyList accept
listNamespacedNetworkPolicy  _ (Namespace namespace) =
  _mkRequest "GET" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListNamespacedNetworkPolicy  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListNamespacedNetworkPolicy Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListNamespacedNetworkPolicy FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListNamespacedNetworkPolicy IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListNamespacedNetworkPolicy LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListNamespacedNetworkPolicy Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListNamespacedNetworkPolicy ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListNamespacedNetworkPolicy TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListNamespacedNetworkPolicy Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces ListNamespacedNetworkPolicy MimeJSON
-- | @application/json;stream=watch@
instance Produces ListNamespacedNetworkPolicy MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListNamespacedNetworkPolicy MimeVndKubernetesProtobufstreamwatch
-- | @application/yaml@
instance Produces ListNamespacedNetworkPolicy MimeYaml


-- *** listNetworkPolicyForAllNamespaces

-- | @GET \/apis\/networking.k8s.io\/v1\/networkpolicies@
-- 
-- list or watch objects of kind NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listNetworkPolicyForAllNamespaces 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest ListNetworkPolicyForAllNamespaces MimeNoContent V1NetworkPolicyList accept
listNetworkPolicyForAllNamespaces  _ =
  _mkRequest "GET" ["/apis/networking.k8s.io/v1/networkpolicies"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListNetworkPolicyForAllNamespaces  

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListNetworkPolicyForAllNamespaces Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces ListNetworkPolicyForAllNamespaces MimeJSON
-- | @application/json;stream=watch@
instance Produces ListNetworkPolicyForAllNamespaces MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListNetworkPolicyForAllNamespaces MimeVndKubernetesProtobuf
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListNetworkPolicyForAllNamespaces MimeVndKubernetesProtobufstreamwatch
-- | @application/yaml@
instance Produces ListNetworkPolicyForAllNamespaces MimeYaml


-- *** patchNamespacedNetworkPolicy

-- | @PATCH \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies\/{name}@
-- 
-- partially update the specified NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
patchNamespacedNetworkPolicy 
  :: (Consumes PatchNamespacedNetworkPolicy contentType, MimeRender contentType Body)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Body -- ^ "body"
  -> Name -- ^ "name" -  name of the NetworkPolicy
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest PatchNamespacedNetworkPolicy contentType V1NetworkPolicy accept
patchNamespacedNetworkPolicy _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PATCH" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data PatchNamespacedNetworkPolicy 
instance HasBodyParam PatchNamespacedNetworkPolicy Body 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam PatchNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @application/json-patch+json@
instance Consumes PatchNamespacedNetworkPolicy MimeJsonPatchjson
-- | @application/merge-patch+json@
instance Consumes PatchNamespacedNetworkPolicy MimeMergePatchjson
-- | @application/strategic-merge-patch+json@
instance Consumes PatchNamespacedNetworkPolicy MimeStrategicMergePatchjson

-- | @application/json@
instance Produces PatchNamespacedNetworkPolicy MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces PatchNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces PatchNamespacedNetworkPolicy MimeYaml


-- *** readNamespacedNetworkPolicy

-- | @GET \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies\/{name}@
-- 
-- read the specified NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
readNamespacedNetworkPolicy 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the NetworkPolicy
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReadNamespacedNetworkPolicy MimeNoContent V1NetworkPolicy accept
readNamespacedNetworkPolicy  _ (Name name) (Namespace namespace) =
  _mkRequest "GET" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ReadNamespacedNetworkPolicy  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReadNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "exact" - Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
instance HasOptionalParam ReadNamespacedNetworkPolicy Exact where
  applyOptionalParam req (Exact xs) =
    req `setQuery` toQuery ("exact", Just xs)

-- | /Optional Param/ "export" - Should this value be exported.  Export strips fields that a user can not specify.
instance HasOptionalParam ReadNamespacedNetworkPolicy Export where
  applyOptionalParam req (Export xs) =
    req `setQuery` toQuery ("export", Just xs)
-- | @application/json@
instance Produces ReadNamespacedNetworkPolicy MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReadNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReadNamespacedNetworkPolicy MimeYaml


-- *** replaceNamespacedNetworkPolicy

-- | @PUT \/apis\/networking.k8s.io\/v1\/namespaces\/{namespace}\/networkpolicies\/{name}@
-- 
-- replace the specified NetworkPolicy
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceNamespacedNetworkPolicy 
  :: (Consumes ReplaceNamespacedNetworkPolicy contentType, MimeRender contentType V1NetworkPolicy)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1NetworkPolicy -- ^ "body"
  -> Name -- ^ "name" -  name of the NetworkPolicy
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReplaceNamespacedNetworkPolicy contentType V1NetworkPolicy accept
replaceNamespacedNetworkPolicy _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PUT" ["/apis/networking.k8s.io/v1/namespaces/",toPath namespace,"/networkpolicies/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceNamespacedNetworkPolicy 
instance HasBodyParam ReplaceNamespacedNetworkPolicy V1NetworkPolicy 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceNamespacedNetworkPolicy Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes ReplaceNamespacedNetworkPolicy mtype

-- | @application/json@
instance Produces ReplaceNamespacedNetworkPolicy MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceNamespacedNetworkPolicy MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReplaceNamespacedNetworkPolicy MimeYaml

