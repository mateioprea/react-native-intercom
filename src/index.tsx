import { NativeModules } from 'react-native';
import type { Intercom } from './types/Intercom';

const { RNNIntercom } = NativeModules;
export default RNNIntercom as Intercom;
