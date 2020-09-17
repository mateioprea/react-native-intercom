import { NativeModules } from 'react-native';

type IntercomType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Intercom } = NativeModules;

export default Intercom as IntercomType;
