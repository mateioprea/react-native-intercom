import type { CompaniesAttributes } from './CompaniesAttributes';

export type UserAttributes = {
  name?: string;
  email?: string;
  companies?: CompaniesAttributes;
};
