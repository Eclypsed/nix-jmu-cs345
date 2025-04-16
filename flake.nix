{
  description = "Development Environment for JMU's CS345";

  outputs = _: {
    nixosModules = {
      bernstdh = import ./modules/nixos.nix;
    };

    homeManagerModules = {
      bernstdh = import ./modules/homeManager.nix;
    };
  };
}
