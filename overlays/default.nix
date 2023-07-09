final: prev:
{
  sui-devnet = import ./sui-devnet.nix prev;
  sui-testnet = import ./sui-testnet.nix prev;
  sui-mainnet = import ./sui-mainnet.nix prev;
}
