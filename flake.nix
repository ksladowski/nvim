{
        inputs = {
                nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
                mnw.url = "github:Gerg-L/mnw";
        };
        outputs =
        {
                self,
                nixpkgs,
                mnw,
                ...
        }: 
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Don't have any other architectures for now at least
        in {
                packages.x86_64-linux.default = import ./default.nix { inherit pkgs mnw; };
        };
}
