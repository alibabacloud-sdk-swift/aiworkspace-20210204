import Foundation
import Tea
import TeaUtils
import AlibabacloudOpenApi
import AlibabaCloudOpenApiUtil
import AlibabacloudEndpointUtil

open class Client : AlibabacloudOpenApi.Client {
    public override init(_ config: AlibabacloudOpenApi.Config) throws {
        try super.init(config)
        self._endpointRule = ""
        try checkConfig(config as! AlibabacloudOpenApi.Config)
        self._endpoint = try getEndpoint("aiworkspace", self._regionId ?? "", self._endpointRule ?? "", self._network ?? "", self._suffix ?? "", self._endpointMap ?? [:], self._endpoint ?? "")
    }

    public func getEndpoint(_ productId: String, _ regionId: String, _ endpointRule: String, _ network: String, _ suffix: String, _ endpointMap: [String: String], _ endpoint: String) throws -> String {
        if (!TeaUtils.Client.empty(endpoint)) {
            return endpoint as! String
        }
        if (!TeaUtils.Client.isUnset(endpointMap) && !TeaUtils.Client.empty(endpointMap[regionId as! String])) {
            return endpointMap[regionId as! String] ?? ""
        }
        return try AlibabacloudEndpointUtil.Client.getEndpointRules(productId, regionId, endpointRule, network, suffix)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addImageWithOptions(_ request: AddImageRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> AddImageResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            body["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.imageId)) {
            body["ImageId"] = request.imageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.imageUri)) {
            body["ImageUri"] = request.imageUri ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            body["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.size)) {
            body["Size"] = request.size!;
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            body["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AddImage",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AddImageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addImage(_ request: AddImageRequest) async throws -> AddImageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await addImageWithOptions(request as! AddImageRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addImageLabelsWithOptions(_ ImageId: String, _ request: AddImageLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> AddImageLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AddImageLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ImageId) + "/labels",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AddImageLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addImageLabels(_ ImageId: String, _ request: AddImageLabelsRequest) async throws -> AddImageLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await addImageLabelsWithOptions(ImageId as! String, request as! AddImageLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addMemberRoleWithOptions(_ WorkspaceId: String, _ MemberId: String, _ RoleName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> AddMemberRoleResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AddMemberRole",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/members/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(MemberId) + "/roles/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(RoleName),
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AddMemberRoleResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addMemberRole(_ WorkspaceId: String, _ MemberId: String, _ RoleName: String) async throws -> AddMemberRoleResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await addMemberRoleWithOptions(WorkspaceId as! String, MemberId as! String, RoleName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCodeSourceWithOptions(_ request: CreateCodeSourceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCodeSourceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            body["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.codeBranch)) {
            body["CodeBranch"] = request.codeBranch ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.codeRepo)) {
            body["CodeRepo"] = request.codeRepo ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.codeRepoAccessToken)) {
            body["CodeRepoAccessToken"] = request.codeRepoAccessToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.codeRepoUserName)) {
            body["CodeRepoUserName"] = request.codeRepoUserName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.displayName)) {
            body["DisplayName"] = request.displayName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.mountPath)) {
            body["MountPath"] = request.mountPath ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            body["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCodeSource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/codesources",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCodeSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCodeSource(_ request: CreateCodeSourceRequest) async throws -> CreateCodeSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createCodeSourceWithOptions(request as! CreateCodeSourceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createDatasetWithOptions(_ request: CreateDatasetRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateDatasetResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            body["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataSourceType)) {
            body["DataSourceType"] = request.dataSourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataType)) {
            body["DataType"] = request.dataType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            body["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.options)) {
            body["Options"] = request.options ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.property)) {
            body["Property"] = request.property ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.providerType)) {
            body["ProviderType"] = request.providerType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            body["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceType)) {
            body["SourceType"] = request.sourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.uri)) {
            body["Uri"] = request.uri ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            body["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateDataset",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateDatasetResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createDataset(_ request: CreateDatasetRequest) async throws -> CreateDatasetResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createDatasetWithOptions(request as! CreateDatasetRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createDatasetLabelsWithOptions(_ DatasetId: String, _ request: CreateDatasetLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateDatasetLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateDatasetLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(DatasetId) + "/labels",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateDatasetLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createDatasetLabels(_ DatasetId: String, _ request: CreateDatasetLabelsRequest) async throws -> CreateDatasetLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createDatasetLabelsWithOptions(DatasetId as! String, request as! CreateDatasetLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createMemberWithOptions(_ WorkspaceId: String, _ request: CreateMemberRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateMemberResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.members)) {
            body["Members"] = request.members ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateMember",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/members",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateMemberResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createMember(_ WorkspaceId: String, _ request: CreateMemberRequest) async throws -> CreateMemberResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createMemberWithOptions(WorkspaceId as! String, request as! CreateMemberRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelWithOptions(_ request: CreateModelRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateModelResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            body["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.domain)) {
            body["Domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.modelDescription)) {
            body["ModelDescription"] = request.modelDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.modelDoc)) {
            body["ModelDoc"] = request.modelDoc ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.modelName)) {
            body["ModelName"] = request.modelName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.orderNumber)) {
            body["OrderNumber"] = request.orderNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.origin)) {
            body["Origin"] = request.origin ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            body["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceType)) {
            body["SourceType"] = request.sourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.task)) {
            body["Task"] = request.task ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            body["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateModel",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateModelResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModel(_ request: CreateModelRequest) async throws -> CreateModelResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createModelWithOptions(request as! CreateModelRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelLabelsWithOptions(_ ModelId: String, _ request: CreateModelLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateModelLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateModelLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/labels",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateModelLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelLabels(_ ModelId: String, _ request: CreateModelLabelsRequest) async throws -> CreateModelLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createModelLabelsWithOptions(ModelId as! String, request as! CreateModelLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelVersionWithOptions(_ ModelId: String, _ request: CreateModelVersionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateModelVersionResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.approvalStatus)) {
            body["ApprovalStatus"] = request.approvalStatus ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.formatType)) {
            body["FormatType"] = request.formatType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.frameworkType)) {
            body["FrameworkType"] = request.frameworkType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.inferenceSpec)) {
            body["InferenceSpec"] = request.inferenceSpec ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.metrics)) {
            body["Metrics"] = request.metrics ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.options)) {
            body["Options"] = request.options ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            body["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceType)) {
            body["SourceType"] = request.sourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trainingSpec)) {
            body["TrainingSpec"] = request.trainingSpec ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.uri)) {
            body["Uri"] = request.uri ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.versionDescription)) {
            body["VersionDescription"] = request.versionDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.versionName)) {
            body["VersionName"] = request.versionName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateModelVersion",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateModelVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelVersion(_ ModelId: String, _ request: CreateModelVersionRequest) async throws -> CreateModelVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createModelVersionWithOptions(ModelId as! String, request as! CreateModelVersionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelVersionLabelsWithOptions(_ ModelId: String, _ VersionName: String, _ request: CreateModelVersionLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateModelVersionLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateModelVersionLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(VersionName) + "/labels",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateModelVersionLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createModelVersionLabels(_ ModelId: String, _ VersionName: String, _ request: CreateModelVersionLabelsRequest) async throws -> CreateModelVersionLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createModelVersionLabelsWithOptions(ModelId as! String, VersionName as! String, request as! CreateModelVersionLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createProductOrdersWithOptions(_ request: CreateProductOrdersRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateProductOrdersResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPay)) {
            body["AutoPay"] = request.autoPay!;
        }
        if (!TeaUtils.Client.isUnset(request.products)) {
            body["Products"] = request.products ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateProductOrders",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/productorders",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateProductOrdersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createProductOrders(_ request: CreateProductOrdersRequest) async throws -> CreateProductOrdersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createProductOrdersWithOptions(request as! CreateProductOrdersRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createWorkspaceWithOptions(_ request: CreateWorkspaceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateWorkspaceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.displayName)) {
            body["DisplayName"] = request.displayName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.envTypes)) {
            body["EnvTypes"] = request.envTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.workspaceName)) {
            body["WorkspaceName"] = request.workspaceName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateWorkspace",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateWorkspaceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createWorkspace(_ request: CreateWorkspaceRequest) async throws -> CreateWorkspaceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createWorkspaceWithOptions(request as! CreateWorkspaceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createWorkspaceResourceWithOptions(_ WorkspaceId: String, _ request: CreateWorkspaceResourceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateWorkspaceResourceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.option)) {
            body["Option"] = request.option ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resources)) {
            body["Resources"] = request.resources ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateWorkspaceResource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/resources",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateWorkspaceResourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createWorkspaceResource(_ WorkspaceId: String, _ request: CreateWorkspaceResourceRequest) async throws -> CreateWorkspaceResourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await createWorkspaceResourceWithOptions(WorkspaceId as! String, request as! CreateWorkspaceResourceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCodeSourceWithOptions(_ CodeSourceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCodeSourceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCodeSource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/codesources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(CodeSourceId),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCodeSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCodeSource(_ CodeSourceId: String) async throws -> DeleteCodeSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteCodeSourceWithOptions(CodeSourceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteDatasetWithOptions(_ DatasetId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteDatasetResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteDataset",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(DatasetId),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteDatasetResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteDataset(_ DatasetId: String) async throws -> DeleteDatasetResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteDatasetWithOptions(DatasetId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteDatasetLabelsWithOptions(_ DatasetId: String, _ request: DeleteDatasetLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteDatasetLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labelKeys)) {
            query["LabelKeys"] = request.labelKeys ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteDatasetLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(DatasetId) + "/labels",
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteDatasetLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteDatasetLabels(_ DatasetId: String, _ request: DeleteDatasetLabelsRequest) async throws -> DeleteDatasetLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteDatasetLabelsWithOptions(DatasetId as! String, request as! DeleteDatasetLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteMembersWithOptions(_ WorkspaceId: String, _ request: DeleteMembersRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteMembersResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.memberIds)) {
            query["MemberIds"] = request.memberIds ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteMembers",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/members",
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteMembersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteMembers(_ WorkspaceId: String, _ request: DeleteMembersRequest) async throws -> DeleteMembersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteMembersWithOptions(WorkspaceId as! String, request as! DeleteMembersRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelWithOptions(_ ModelId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteModelResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteModel",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteModelResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModel(_ ModelId: String) async throws -> DeleteModelResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteModelWithOptions(ModelId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelLabelsWithOptions(_ ModelId: String, _ request: DeleteModelLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteModelLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labelKeys)) {
            query["LabelKeys"] = request.labelKeys ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteModelLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/labels",
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteModelLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelLabels(_ ModelId: String, _ request: DeleteModelLabelsRequest) async throws -> DeleteModelLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteModelLabelsWithOptions(ModelId as! String, request as! DeleteModelLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelVersionWithOptions(_ ModelId: String, _ VersionName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteModelVersionResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteModelVersion",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(VersionName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteModelVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelVersion(_ ModelId: String, _ VersionName: String) async throws -> DeleteModelVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteModelVersionWithOptions(ModelId as! String, VersionName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelVersionLabelsWithOptions(_ ModelId: String, _ VersionName: String, _ request: DeleteModelVersionLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteModelVersionLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.labelKeys)) {
            query["LabelKeys"] = request.labelKeys ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteModelVersionLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(VersionName) + "/labels",
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteModelVersionLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteModelVersionLabels(_ ModelId: String, _ VersionName: String, _ request: DeleteModelVersionLabelsRequest) async throws -> DeleteModelVersionLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteModelVersionLabelsWithOptions(ModelId as! String, VersionName as! String, request as! DeleteModelVersionLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteWorkspaceWithOptions(_ WorkspaceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteWorkspaceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteWorkspace",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteWorkspaceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteWorkspace(_ WorkspaceId: String) async throws -> DeleteWorkspaceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteWorkspaceWithOptions(WorkspaceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteWorkspaceResourceWithOptions(_ WorkspaceId: String, _ request: DeleteWorkspaceResourceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteWorkspaceResourceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.groupName)) {
            query["GroupName"] = request.groupName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            query["Labels"] = request.labels ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.option)) {
            query["Option"] = request.option ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            query["ProductType"] = request.productType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceIds)) {
            query["ResourceIds"] = request.resourceIds ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteWorkspaceResource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/resources",
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteWorkspaceResourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteWorkspaceResource(_ WorkspaceId: String, _ request: DeleteWorkspaceResourceRequest) async throws -> DeleteWorkspaceResourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await deleteWorkspaceResourceWithOptions(WorkspaceId as! String, request as! DeleteWorkspaceResourceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getCodeSourceWithOptions(_ CodeSourceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetCodeSourceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetCodeSource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/codesources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(CodeSourceId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetCodeSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getCodeSource(_ CodeSourceId: String) async throws -> GetCodeSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getCodeSourceWithOptions(CodeSourceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDatasetWithOptions(_ DatasetId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDatasetResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDataset",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(DatasetId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDatasetResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataset(_ DatasetId: String) async throws -> GetDatasetResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDatasetWithOptions(DatasetId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDefaultWorkspaceWithOptions(_ request: GetDefaultWorkspaceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDefaultWorkspaceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDefaultWorkspace",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/defaultWorkspaces",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDefaultWorkspaceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDefaultWorkspace(_ request: GetDefaultWorkspaceRequest) async throws -> GetDefaultWorkspaceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDefaultWorkspaceWithOptions(request as! GetDefaultWorkspaceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getImageWithOptions(_ ImageId: String, _ request: GetImageRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetImageResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetImage",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ImageId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetImageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getImage(_ ImageId: String, _ request: GetImageRequest) async throws -> GetImageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getImageWithOptions(ImageId as! String, request as! GetImageRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getMemberWithOptions(_ WorkspaceId: String, _ request: GetMemberRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetMemberResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.memberId)) {
            query["MemberId"] = request.memberId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.userId)) {
            query["UserId"] = request.userId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetMember",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/member",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetMemberResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getMember(_ WorkspaceId: String, _ request: GetMemberRequest) async throws -> GetMemberResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getMemberWithOptions(WorkspaceId as! String, request as! GetMemberRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getModelWithOptions(_ ModelId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetModelResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetModel",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetModelResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getModel(_ ModelId: String) async throws -> GetModelResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getModelWithOptions(ModelId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getModelVersionWithOptions(_ ModelId: String, _ VersionName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetModelVersionResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetModelVersion",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(VersionName),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetModelVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getModelVersion(_ ModelId: String, _ VersionName: String) async throws -> GetModelVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getModelVersionWithOptions(ModelId as! String, VersionName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getPermissionWithOptions(_ WorkspaceId: String, _ PermissionCode: String, _ request: GetPermissionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetPermissionResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            query["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.creator)) {
            query["Creator"] = request.creator ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetPermission",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/permissions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(PermissionCode),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetPermissionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getPermission(_ WorkspaceId: String, _ PermissionCode: String, _ request: GetPermissionRequest) async throws -> GetPermissionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getPermissionWithOptions(WorkspaceId as! String, PermissionCode as! String, request as! GetPermissionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getServiceTemplateWithOptions(_ ServiceTemplateId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetServiceTemplateResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetServiceTemplate",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/servicetemplates/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ServiceTemplateId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetServiceTemplateResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getServiceTemplate(_ ServiceTemplateId: String) async throws -> GetServiceTemplateResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getServiceTemplateWithOptions(ServiceTemplateId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getWorkspaceWithOptions(_ WorkspaceId: String, _ request: GetWorkspaceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetWorkspaceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetWorkspace",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId),
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetWorkspaceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getWorkspace(_ WorkspaceId: String, _ request: GetWorkspaceRequest) async throws -> GetWorkspaceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getWorkspaceWithOptions(WorkspaceId as! String, request as! GetWorkspaceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listCodeSourcesWithOptions(_ request: ListCodeSourcesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListCodeSourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.displayName)) {
            query["DisplayName"] = request.displayName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.sortBy)) {
            query["SortBy"] = request.sortBy ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            query["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListCodeSources",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/codesources",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListCodeSourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listCodeSources(_ request: ListCodeSourcesRequest) async throws -> ListCodeSourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listCodeSourcesWithOptions(request as! ListCodeSourcesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDatasetsWithOptions(_ request: ListDatasetsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListDatasetsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.dataSourceTypes)) {
            query["DataSourceTypes"] = request.dataSourceTypes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataTypes)) {
            query["DataTypes"] = request.dataTypes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.label)) {
            query["Label"] = request.label ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.properties)) {
            query["Properties"] = request.properties ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            query["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceTypes)) {
            query["SourceTypes"] = request.sourceTypes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            query["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListDatasets",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListDatasetsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listDatasets(_ request: ListDatasetsRequest) async throws -> ListDatasetsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listDatasetsWithOptions(request as! ListDatasetsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listImageLabelsWithOptions(_ request: ListImageLabelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListImageLabelsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.imageId)) {
            query["ImageId"] = request.imageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labelFilter)) {
            query["LabelFilter"] = request.labelFilter ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labelKeys)) {
            query["LabelKeys"] = request.labelKeys ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.region)) {
            query["Region"] = request.region ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            query["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListImageLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/image/labels",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListImageLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listImageLabels(_ request: ListImageLabelsRequest) async throws -> ListImageLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listImageLabelsWithOptions(request as! ListImageLabelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listImagesWithOptions(_ request: ListImagesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListImagesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            query["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            query["Labels"] = request.labels ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.parentUserId)) {
            query["ParentUserId"] = request.parentUserId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.query)) {
            query["Query"] = request.query ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sortBy)) {
            query["SortBy"] = request.sortBy ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.userId)) {
            query["UserId"] = request.userId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            query["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListImages",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListImagesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listImages(_ request: ListImagesRequest) async throws -> ListImagesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listImagesWithOptions(request as! ListImagesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listMembersWithOptions(_ WorkspaceId: String, _ request: ListMembersRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListMembersResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.memberName)) {
            query["MemberName"] = request.memberName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.roles)) {
            query["Roles"] = request.roles ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListMembers",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/members",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListMembersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listMembers(_ WorkspaceId: String, _ request: ListMembersRequest) async throws -> ListMembersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listMembersWithOptions(WorkspaceId as! String, request as! ListMembersRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listModelVersionsWithOptions(_ ModelId: String, _ request: ListModelVersionsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListModelVersionsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.approvalStatus)) {
            query["ApprovalStatus"] = request.approvalStatus ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.formatType)) {
            query["FormatType"] = request.formatType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.frameworkType)) {
            query["FrameworkType"] = request.frameworkType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.label)) {
            query["Label"] = request.label ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.sortBy)) {
            query["SortBy"] = request.sortBy ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            query["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceType)) {
            query["SourceType"] = request.sourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.versionName)) {
            query["VersionName"] = request.versionName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListModelVersions",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListModelVersionsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listModelVersions(_ ModelId: String, _ request: ListModelVersionsRequest) async throws -> ListModelVersionsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listModelVersionsWithOptions(ModelId as! String, request as! ListModelVersionsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listModelsWithOptions(_ request: ListModelsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListModelsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.domain)) {
            query["Domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.label)) {
            query["Label"] = request.label ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.modelName)) {
            query["ModelName"] = request.modelName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.origin)) {
            query["Origin"] = request.origin ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.provider)) {
            query["Provider"] = request.provider ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.query)) {
            query["Query"] = request.query ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sortBy)) {
            query["SortBy"] = request.sortBy ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.souceType)) {
            query["SouceType"] = request.souceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            query["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.task)) {
            query["Task"] = request.task ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            query["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListModels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListModelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listModels(_ request: ListModelsRequest) async throws -> ListModelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listModelsWithOptions(request as! ListModelsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listPermissionsWithOptions(_ WorkspaceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListPermissionsResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListPermissions",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/permissions",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListPermissionsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listPermissions(_ WorkspaceId: String) async throws -> ListPermissionsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listPermissionsWithOptions(WorkspaceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listProductsWithOptions(_ request: ListProductsRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListProductsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.productCodes)) {
            query["ProductCodes"] = request.productCodes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.serviceCodes)) {
            query["ServiceCodes"] = request.serviceCodes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListProducts",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/products",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListProductsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listProducts(_ request: ListProductsRequest) async throws -> ListProductsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listProductsWithOptions(request as! ListProductsRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listQuotasWithOptions(_ request: ListQuotasRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListQuotasResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListQuotas",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/quotas",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListQuotasResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listQuotas(_ request: ListQuotasRequest) async throws -> ListQuotasResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listQuotasWithOptions(request as! ListQuotasRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listResourcesWithOptions(_ request: ListResourcesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListResourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.groupName)) {
            query["GroupName"] = request.groupName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            query["Labels"] = request.labels ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.option)) {
            query["Option"] = request.option ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.productTypes)) {
            query["ProductTypes"] = request.productTypes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.quotaIds)) {
            query["QuotaIds"] = request.quotaIds ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceName)) {
            query["ResourceName"] = request.resourceName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceTypes)) {
            query["ResourceTypes"] = request.resourceTypes ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        if (!TeaUtils.Client.isUnset(request.verboseFields)) {
            query["VerboseFields"] = request.verboseFields ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            query["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListResources",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/resources",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListResourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listResources(_ request: ListResourcesRequest) async throws -> ListResourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listResourcesWithOptions(request as! ListResourcesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listServiceTemplatesWithOptions(_ request: ListServiceTemplatesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListServiceTemplatesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.label)) {
            query["Label"] = request.label ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.provider)) {
            query["Provider"] = request.provider ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.query)) {
            query["Query"] = request.query ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.serviceTemplateName)) {
            query["ServiceTemplateName"] = request.serviceTemplateName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sortBy)) {
            query["SortBy"] = request.sortBy ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListServiceTemplates",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/servicetemplates",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListServiceTemplatesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listServiceTemplates(_ request: ListServiceTemplatesRequest) async throws -> ListServiceTemplatesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listServiceTemplatesWithOptions(request as! ListServiceTemplatesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listWorkspaceUsersWithOptions(_ WorkspaceId: String, _ request: ListWorkspaceUsersRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListWorkspaceUsersResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.userName)) {
            query["UserName"] = request.userName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListWorkspaceUsers",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/users",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListWorkspaceUsersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listWorkspaceUsers(_ WorkspaceId: String, _ request: ListWorkspaceUsersRequest) async throws -> ListWorkspaceUsersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listWorkspaceUsersWithOptions(WorkspaceId as! String, request as! ListWorkspaceUsersRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listWorkspacesWithOptions(_ request: ListWorkspacesRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> ListWorkspacesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.fields)) {
            query["Fields"] = request.fields ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleList)) {
            query["ModuleList"] = request.moduleList ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.option)) {
            query["Option"] = request.option ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.order)) {
            query["Order"] = request.order ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.sortBy)) {
            query["SortBy"] = request.sortBy ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.status)) {
            query["Status"] = request.status ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.verbose)) {
            query["Verbose"] = request.verbose!;
        }
        if (!TeaUtils.Client.isUnset(request.workspaceIds)) {
            query["WorkspaceIds"] = request.workspaceIds ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.workspaceName)) {
            query["WorkspaceName"] = request.workspaceName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListWorkspaces",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListWorkspacesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listWorkspaces(_ request: ListWorkspacesRequest) async throws -> ListWorkspacesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await listWorkspacesWithOptions(request as! ListWorkspacesRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishCodeSourceWithOptions(_ CodeSourceId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PublishCodeSourceResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PublishCodeSource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/codesources/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(CodeSourceId) + "/publish",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PublishCodeSourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishCodeSource(_ CodeSourceId: String) async throws -> PublishCodeSourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await publishCodeSourceWithOptions(CodeSourceId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishDatasetWithOptions(_ DatasetId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PublishDatasetResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PublishDataset",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(DatasetId) + "/publish",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PublishDatasetResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishDataset(_ DatasetId: String) async throws -> PublishDatasetResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await publishDatasetWithOptions(DatasetId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishImageWithOptions(_ ImageId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PublishImageResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PublishImage",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ImageId) + "/publish",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PublishImageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishImage(_ ImageId: String) async throws -> PublishImageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await publishImageWithOptions(ImageId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeImageWithOptions(_ ImageId: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> RemoveImageResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RemoveImage",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ImageId),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RemoveImageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeImage(_ ImageId: String) async throws -> RemoveImageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await removeImageWithOptions(ImageId as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeImageLabelsWithOptions(_ ImageId: String, _ LabelKeys: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> RemoveImageLabelsResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RemoveImageLabels",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/images/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ImageId) + "/labels/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(LabelKeys),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RemoveImageLabelsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeImageLabels(_ ImageId: String, _ LabelKeys: String) async throws -> RemoveImageLabelsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await removeImageLabelsWithOptions(ImageId as! String, LabelKeys as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeMemberRoleWithOptions(_ WorkspaceId: String, _ MemberId: String, _ RoleName: String, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> RemoveMemberRoleResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RemoveMemberRole",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/members/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(MemberId) + "/roles/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(RoleName),
            "method": "DELETE",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RemoveMemberRoleResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeMemberRole(_ WorkspaceId: String, _ MemberId: String, _ RoleName: String) async throws -> RemoveMemberRoleResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await removeMemberRoleWithOptions(WorkspaceId as! String, MemberId as! String, RoleName as! String, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateDatasetWithOptions(_ DatasetId: String, _ request: UpdateDatasetRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateDatasetResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            body["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.options)) {
            body["Options"] = request.options ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateDataset",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/datasets/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(DatasetId),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateDatasetResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateDataset(_ DatasetId: String, _ request: UpdateDatasetRequest) async throws -> UpdateDatasetResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateDatasetWithOptions(DatasetId as! String, request as! UpdateDatasetRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateDefaultWorkspaceWithOptions(_ request: UpdateDefaultWorkspaceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateDefaultWorkspaceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.workspaceId)) {
            body["WorkspaceId"] = request.workspaceId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateDefaultWorkspace",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/defaultWorkspaces",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateDefaultWorkspaceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateDefaultWorkspace(_ request: UpdateDefaultWorkspaceRequest) async throws -> UpdateDefaultWorkspaceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateDefaultWorkspaceWithOptions(request as! UpdateDefaultWorkspaceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateModelWithOptions(_ ModelId: String, _ request: UpdateModelRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateModelResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessibility)) {
            body["Accessibility"] = request.accessibility ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.domain)) {
            body["Domain"] = request.domain ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.modelDescription)) {
            body["ModelDescription"] = request.modelDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.modelDoc)) {
            body["ModelDoc"] = request.modelDoc ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.modelName)) {
            body["ModelName"] = request.modelName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.orderNumber)) {
            body["OrderNumber"] = request.orderNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.origin)) {
            body["Origin"] = request.origin ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            body["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceType)) {
            body["SourceType"] = request.sourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.task)) {
            body["Task"] = request.task ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateModel",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateModelResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateModel(_ ModelId: String, _ request: UpdateModelRequest) async throws -> UpdateModelResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateModelWithOptions(ModelId as! String, request as! UpdateModelRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateModelVersionWithOptions(_ ModelId: String, _ VersionName: String, _ request: UpdateModelVersionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateModelVersionResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.approvalStatus)) {
            body["ApprovalStatus"] = request.approvalStatus ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.inferenceSpec)) {
            body["InferenceSpec"] = request.inferenceSpec ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.metrics)) {
            body["Metrics"] = request.metrics ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.options)) {
            body["Options"] = request.options ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceId)) {
            body["SourceId"] = request.sourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.sourceType)) {
            body["SourceType"] = request.sourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trainingSpec)) {
            body["TrainingSpec"] = request.trainingSpec ?? [:];
        }
        if (!TeaUtils.Client.isUnset(request.versionDescription)) {
            body["VersionDescription"] = request.versionDescription ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateModelVersion",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/models/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(ModelId) + "/versions/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(VersionName),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateModelVersionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateModelVersion(_ ModelId: String, _ VersionName: String, _ request: UpdateModelVersionRequest) async throws -> UpdateModelVersionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateModelVersionWithOptions(ModelId as! String, VersionName as! String, request as! UpdateModelVersionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateWorkspaceWithOptions(_ WorkspaceId: String, _ request: UpdateWorkspaceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateWorkspaceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.description_)) {
            body["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.displayName)) {
            body["DisplayName"] = request.displayName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateWorkspace",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId),
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateWorkspaceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateWorkspace(_ WorkspaceId: String, _ request: UpdateWorkspaceRequest) async throws -> UpdateWorkspaceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateWorkspaceWithOptions(WorkspaceId as! String, request as! UpdateWorkspaceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateWorkspaceResourceWithOptions(_ WorkspaceId: String, _ request: UpdateWorkspaceResourceRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateWorkspaceResourceResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.groupName)) {
            body["GroupName"] = request.groupName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.isDefault)) {
            body["IsDefault"] = request.isDefault!;
        }
        if (!TeaUtils.Client.isUnset(request.labels)) {
            body["Labels"] = request.labels ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["ProductType"] = request.productType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceIds)) {
            body["ResourceIds"] = request.resourceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            body["ResourceType"] = request.resourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.spec)) {
            body["Spec"] = request.spec ?? [:];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateWorkspaceResource",
            "version": "2021-02-04",
            "protocol": "HTTPS",
            "pathname": "/api/v1/workspaces/" + AlibabaCloudOpenApiUtil.Client.getEncodeParam(WorkspaceId) + "/resources",
            "method": "PUT",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateWorkspaceResourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateWorkspaceResource(_ WorkspaceId: String, _ request: UpdateWorkspaceResourceRequest) async throws -> UpdateWorkspaceResourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await updateWorkspaceResourceWithOptions(WorkspaceId as! String, request as! UpdateWorkspaceResourceRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }
}
