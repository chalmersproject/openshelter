import { FieldPolicy, FieldReadFunction, TypePolicies, TypePolicy } from '@apollo/client/cache';
export type CreateShelterPayloadKeySpecifier = ('clientMutationId' | 'errors' | 'shelter' | CreateShelterPayloadKeySpecifier)[];
export type CreateShelterPayloadFieldPolicy = {
	clientMutationId?: FieldPolicy<any> | FieldReadFunction<any>,
	errors?: FieldPolicy<any> | FieldReadFunction<any>,
	shelter?: FieldPolicy<any> | FieldReadFunction<any>
};
export type MutationKeySpecifier = ('createShelter' | 'greet' | MutationKeySpecifier)[];
export type MutationFieldPolicy = {
	createShelter?: FieldPolicy<any> | FieldReadFunction<any>,
	greet?: FieldPolicy<any> | FieldReadFunction<any>
};
export type QueryKeySpecifier = ('testField' | 'testSignalType' | 'version' | 'viewer' | QueryKeySpecifier)[];
export type QueryFieldPolicy = {
	testField?: FieldPolicy<any> | FieldReadFunction<any>,
	testSignalType?: FieldPolicy<any> | FieldReadFunction<any>,
	version?: FieldPolicy<any> | FieldReadFunction<any>,
	viewer?: FieldPolicy<any> | FieldReadFunction<any>
};
export type ShelterKeySpecifier = ('address' | 'createdAt' | 'email' | 'id' | 'name' | 'phone' | 'updatedAt' | ShelterKeySpecifier)[];
export type ShelterFieldPolicy = {
	address?: FieldPolicy<any> | FieldReadFunction<any>,
	createdAt?: FieldPolicy<any> | FieldReadFunction<any>,
	email?: FieldPolicy<any> | FieldReadFunction<any>,
	id?: FieldPolicy<any> | FieldReadFunction<any>,
	name?: FieldPolicy<any> | FieldReadFunction<any>,
	phone?: FieldPolicy<any> | FieldReadFunction<any>,
	updatedAt?: FieldPolicy<any> | FieldReadFunction<any>
};
export type SubscriptionKeySpecifier = ('testField' | SubscriptionKeySpecifier)[];
export type SubscriptionFieldPolicy = {
	testField?: FieldPolicy<any> | FieldReadFunction<any>
};
export type TestFieldPayloadKeySpecifier = ('value' | TestFieldPayloadKeySpecifier)[];
export type TestFieldPayloadFieldPolicy = {
	value?: FieldPolicy<any> | FieldReadFunction<any>
};
export type UserKeySpecifier = ('createdAt' | 'currentLoginAt' | 'currentLoginIp' | 'email' | 'emailVerified' | 'id' | 'lastLoginAt' | 'lastLoginIp' | 'updatedAt' | UserKeySpecifier)[];
export type UserFieldPolicy = {
	createdAt?: FieldPolicy<any> | FieldReadFunction<any>,
	currentLoginAt?: FieldPolicy<any> | FieldReadFunction<any>,
	currentLoginIp?: FieldPolicy<any> | FieldReadFunction<any>,
	email?: FieldPolicy<any> | FieldReadFunction<any>,
	emailVerified?: FieldPolicy<any> | FieldReadFunction<any>,
	id?: FieldPolicy<any> | FieldReadFunction<any>,
	lastLoginAt?: FieldPolicy<any> | FieldReadFunction<any>,
	lastLoginIp?: FieldPolicy<any> | FieldReadFunction<any>,
	updatedAt?: FieldPolicy<any> | FieldReadFunction<any>
};
export type ValidationErrorKeySpecifier = ('field' | 'message' | ValidationErrorKeySpecifier)[];
export type ValidationErrorFieldPolicy = {
	field?: FieldPolicy<any> | FieldReadFunction<any>,
	message?: FieldPolicy<any> | FieldReadFunction<any>
};
export type StrictTypedTypePolicies = {
	CreateShelterPayload?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | CreateShelterPayloadKeySpecifier | (() => undefined | CreateShelterPayloadKeySpecifier),
		fields?: CreateShelterPayloadFieldPolicy,
	},
	Mutation?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | MutationKeySpecifier | (() => undefined | MutationKeySpecifier),
		fields?: MutationFieldPolicy,
	},
	Query?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | QueryKeySpecifier | (() => undefined | QueryKeySpecifier),
		fields?: QueryFieldPolicy,
	},
	Shelter?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | ShelterKeySpecifier | (() => undefined | ShelterKeySpecifier),
		fields?: ShelterFieldPolicy,
	},
	Subscription?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | SubscriptionKeySpecifier | (() => undefined | SubscriptionKeySpecifier),
		fields?: SubscriptionFieldPolicy,
	},
	TestFieldPayload?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | TestFieldPayloadKeySpecifier | (() => undefined | TestFieldPayloadKeySpecifier),
		fields?: TestFieldPayloadFieldPolicy,
	},
	User?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | UserKeySpecifier | (() => undefined | UserKeySpecifier),
		fields?: UserFieldPolicy,
	},
	ValidationError?: Omit<TypePolicy, "fields" | "keyFields"> & {
		keyFields?: false | ValidationErrorKeySpecifier | (() => undefined | ValidationErrorKeySpecifier),
		fields?: ValidationErrorFieldPolicy,
	}
};
export type TypedTypePolicies = StrictTypedTypePolicies & TypePolicies;