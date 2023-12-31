/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Interface, type ContractRunner } from "ethers";
import type {
  IBravoCallee,
  IBravoCalleeInterface,
} from "../../contracts/IBravoCallee";

const _abi = [
  {
    inputs: [
      {
        internalType: "string",
        name: "result",
        type: "string",
      },
    ],
    name: "cartesiCallback",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
] as const;

export class IBravoCallee__factory {
  static readonly abi = _abi;
  static createInterface(): IBravoCalleeInterface {
    return new Interface(_abi) as IBravoCalleeInterface;
  }
  static connect(
    address: string,
    runner?: ContractRunner | null
  ): IBravoCallee {
    return new Contract(address, _abi, runner) as unknown as IBravoCallee;
  }
}
