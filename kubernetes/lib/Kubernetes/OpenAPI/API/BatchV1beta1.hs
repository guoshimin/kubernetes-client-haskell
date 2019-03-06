{-
   Kubernetes

   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   OpenAPI Version: 3.0.1
   Kubernetes API version: v1.9.12
   Generated by OpenAPI Generator (https://openapi-generator.tech)
-}

{-|
Module : Kubernetes.OpenAPI.API.BatchV1beta1
-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module Kubernetes.OpenAPI.API.BatchV1beta1 where

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


-- ** BatchV1beta1

-- *** createNamespacedCronJob

-- | @POST \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs@
-- 
-- create a CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
createNamespacedCronJob 
  :: (Consumes CreateNamespacedCronJob contentType, MimeRender contentType V1beta1CronJob)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1beta1CronJob -- ^ "body"
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest CreateNamespacedCronJob contentType V1beta1CronJob accept
createNamespacedCronJob _  _ body (Namespace namespace) =
  _mkRequest "POST" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data CreateNamespacedCronJob 
instance HasBodyParam CreateNamespacedCronJob V1beta1CronJob 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam CreateNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes CreateNamespacedCronJob mtype

-- | @application/json@
instance Produces CreateNamespacedCronJob MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces CreateNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces CreateNamespacedCronJob MimeYaml


-- *** deleteCollectionNamespacedCronJob

-- | @DELETE \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs@
-- 
-- delete collection of CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteCollectionNamespacedCronJob 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteCollectionNamespacedCronJob MimeNoContent V1Status accept
deleteCollectionNamespacedCronJob  _ (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data DeleteCollectionNamespacedCronJob  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteCollectionNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam DeleteCollectionNamespacedCronJob Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedCronJob FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam DeleteCollectionNamespacedCronJob IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedCronJob LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam DeleteCollectionNamespacedCronJob Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam DeleteCollectionNamespacedCronJob ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam DeleteCollectionNamespacedCronJob TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam DeleteCollectionNamespacedCronJob Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces DeleteCollectionNamespacedCronJob MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteCollectionNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces DeleteCollectionNamespacedCronJob MimeYaml


-- *** deleteNamespacedCronJob

-- | @DELETE \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}@
-- 
-- delete a CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteNamespacedCronJob 
  :: (Consumes DeleteNamespacedCronJob contentType, MimeRender contentType V1DeleteOptions)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1DeleteOptions -- ^ "body"
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteNamespacedCronJob contentType V1Status accept
deleteNamespacedCronJob _  _ body (Name name) (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data DeleteNamespacedCronJob 
instance HasBodyParam DeleteNamespacedCronJob V1DeleteOptions 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "gracePeriodSeconds" - The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
instance HasOptionalParam DeleteNamespacedCronJob GracePeriodSeconds where
  applyOptionalParam req (GracePeriodSeconds xs) =
    req `setQuery` toQuery ("gracePeriodSeconds", Just xs)

-- | /Optional Param/ "orphanDependents" - Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
instance HasOptionalParam DeleteNamespacedCronJob OrphanDependents where
  applyOptionalParam req (OrphanDependents xs) =
    req `setQuery` toQuery ("orphanDependents", Just xs)

-- | /Optional Param/ "propagationPolicy" - Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
instance HasOptionalParam DeleteNamespacedCronJob PropagationPolicy where
  applyOptionalParam req (PropagationPolicy xs) =
    req `setQuery` toQuery ("propagationPolicy", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes DeleteNamespacedCronJob mtype

-- | @application/json@
instance Produces DeleteNamespacedCronJob MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces DeleteNamespacedCronJob MimeYaml


-- *** getAPIResources

-- | @GET \/apis\/batch\/v1beta1\/@
-- 
-- get available resources
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
getAPIResources 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest GetAPIResources MimeNoContent V1APIResourceList accept
getAPIResources  _ =
  _mkRequest "GET" ["/apis/batch/v1beta1/"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data GetAPIResources  
-- | @application/json@
instance Produces GetAPIResources MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces GetAPIResources MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces GetAPIResources MimeYaml


-- *** listCronJobForAllNamespaces

-- | @GET \/apis\/batch\/v1beta1\/cronjobs@
-- 
-- list or watch objects of kind CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listCronJobForAllNamespaces 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest ListCronJobForAllNamespaces MimeNoContent V1beta1CronJobList accept
listCronJobForAllNamespaces  _ =
  _mkRequest "GET" ["/apis/batch/v1beta1/cronjobs"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListCronJobForAllNamespaces  

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListCronJobForAllNamespaces Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListCronJobForAllNamespaces FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListCronJobForAllNamespaces IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListCronJobForAllNamespaces LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListCronJobForAllNamespaces Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListCronJobForAllNamespaces Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListCronJobForAllNamespaces ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListCronJobForAllNamespaces TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListCronJobForAllNamespaces Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces ListCronJobForAllNamespaces MimeJSON
-- | @application/json;stream=watch@
instance Produces ListCronJobForAllNamespaces MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListCronJobForAllNamespaces MimeVndKubernetesProtobuf
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListCronJobForAllNamespaces MimeVndKubernetesProtobufstreamwatch
-- | @application/yaml@
instance Produces ListCronJobForAllNamespaces MimeYaml


-- *** listNamespacedCronJob

-- | @GET \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs@
-- 
-- list or watch objects of kind CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listNamespacedCronJob 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ListNamespacedCronJob MimeNoContent V1beta1CronJobList accept
listNamespacedCronJob  _ (Namespace namespace) =
  _mkRequest "GET" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListNamespacedCronJob  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListNamespacedCronJob Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListNamespacedCronJob FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListNamespacedCronJob IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListNamespacedCronJob LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListNamespacedCronJob Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListNamespacedCronJob ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListNamespacedCronJob TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListNamespacedCronJob Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces ListNamespacedCronJob MimeJSON
-- | @application/json;stream=watch@
instance Produces ListNamespacedCronJob MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListNamespacedCronJob MimeVndKubernetesProtobufstreamwatch
-- | @application/yaml@
instance Produces ListNamespacedCronJob MimeYaml


-- *** patchNamespacedCronJob

-- | @PATCH \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}@
-- 
-- partially update the specified CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
patchNamespacedCronJob 
  :: (Consumes PatchNamespacedCronJob contentType, MimeRender contentType Body)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Body -- ^ "body"
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest PatchNamespacedCronJob contentType V1beta1CronJob accept
patchNamespacedCronJob _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PATCH" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data PatchNamespacedCronJob 
instance HasBodyParam PatchNamespacedCronJob Body 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam PatchNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @application/json-patch+json@
instance Consumes PatchNamespacedCronJob MimeJsonPatchjson
-- | @application/merge-patch+json@
instance Consumes PatchNamespacedCronJob MimeMergePatchjson
-- | @application/strategic-merge-patch+json@
instance Consumes PatchNamespacedCronJob MimeStrategicMergePatchjson

-- | @application/json@
instance Produces PatchNamespacedCronJob MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces PatchNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces PatchNamespacedCronJob MimeYaml


-- *** patchNamespacedCronJobStatus

-- | @PATCH \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}\/status@
-- 
-- partially update status of the specified CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
patchNamespacedCronJobStatus 
  :: (Consumes PatchNamespacedCronJobStatus contentType, MimeRender contentType Body)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Body -- ^ "body"
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest PatchNamespacedCronJobStatus contentType V1beta1CronJob accept
patchNamespacedCronJobStatus _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PATCH" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name,"/status"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data PatchNamespacedCronJobStatus 
instance HasBodyParam PatchNamespacedCronJobStatus Body 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam PatchNamespacedCronJobStatus Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @application/json-patch+json@
instance Consumes PatchNamespacedCronJobStatus MimeJsonPatchjson
-- | @application/merge-patch+json@
instance Consumes PatchNamespacedCronJobStatus MimeMergePatchjson
-- | @application/strategic-merge-patch+json@
instance Consumes PatchNamespacedCronJobStatus MimeStrategicMergePatchjson

-- | @application/json@
instance Produces PatchNamespacedCronJobStatus MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces PatchNamespacedCronJobStatus MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces PatchNamespacedCronJobStatus MimeYaml


-- *** readNamespacedCronJob

-- | @GET \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}@
-- 
-- read the specified CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
readNamespacedCronJob 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReadNamespacedCronJob MimeNoContent V1beta1CronJob accept
readNamespacedCronJob  _ (Name name) (Namespace namespace) =
  _mkRequest "GET" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ReadNamespacedCronJob  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReadNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "exact" - Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
instance HasOptionalParam ReadNamespacedCronJob Exact where
  applyOptionalParam req (Exact xs) =
    req `setQuery` toQuery ("exact", Just xs)

-- | /Optional Param/ "export" - Should this value be exported.  Export strips fields that a user can not specify.
instance HasOptionalParam ReadNamespacedCronJob Export where
  applyOptionalParam req (Export xs) =
    req `setQuery` toQuery ("export", Just xs)
-- | @application/json@
instance Produces ReadNamespacedCronJob MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReadNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReadNamespacedCronJob MimeYaml


-- *** readNamespacedCronJobStatus

-- | @GET \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}\/status@
-- 
-- read status of the specified CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
readNamespacedCronJobStatus 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReadNamespacedCronJobStatus MimeNoContent V1beta1CronJob accept
readNamespacedCronJobStatus  _ (Name name) (Namespace namespace) =
  _mkRequest "GET" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name,"/status"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ReadNamespacedCronJobStatus  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReadNamespacedCronJobStatus Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)
-- | @application/json@
instance Produces ReadNamespacedCronJobStatus MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReadNamespacedCronJobStatus MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReadNamespacedCronJobStatus MimeYaml


-- *** replaceNamespacedCronJob

-- | @PUT \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}@
-- 
-- replace the specified CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceNamespacedCronJob 
  :: (Consumes ReplaceNamespacedCronJob contentType, MimeRender contentType V1beta1CronJob)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1beta1CronJob -- ^ "body"
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReplaceNamespacedCronJob contentType V1beta1CronJob accept
replaceNamespacedCronJob _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PUT" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceNamespacedCronJob 
instance HasBodyParam ReplaceNamespacedCronJob V1beta1CronJob 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceNamespacedCronJob Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes ReplaceNamespacedCronJob mtype

-- | @application/json@
instance Produces ReplaceNamespacedCronJob MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceNamespacedCronJob MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReplaceNamespacedCronJob MimeYaml


-- *** replaceNamespacedCronJobStatus

-- | @PUT \/apis\/batch\/v1beta1\/namespaces\/{namespace}\/cronjobs\/{name}\/status@
-- 
-- replace status of the specified CronJob
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceNamespacedCronJobStatus 
  :: (Consumes ReplaceNamespacedCronJobStatus contentType, MimeRender contentType V1beta1CronJob)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1beta1CronJob -- ^ "body"
  -> Name -- ^ "name" -  name of the CronJob
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReplaceNamespacedCronJobStatus contentType V1beta1CronJob accept
replaceNamespacedCronJobStatus _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PUT" ["/apis/batch/v1beta1/namespaces/",toPath namespace,"/cronjobs/",toPath name,"/status"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceNamespacedCronJobStatus 
instance HasBodyParam ReplaceNamespacedCronJobStatus V1beta1CronJob 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceNamespacedCronJobStatus Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes ReplaceNamespacedCronJobStatus mtype

-- | @application/json@
instance Produces ReplaceNamespacedCronJobStatus MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceNamespacedCronJobStatus MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReplaceNamespacedCronJobStatus MimeYaml

