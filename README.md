A nixos module for installing a pre-configured development environment for JMU's CS345 on NixOS
## Setup
### Using flakes
Inside your main `flake.nix`
```nix
{
  description = "System Configuration Flake";

  inputs = {
    nix-jmu-cs345.url = "github:Eclypsed/nix-jmu-cs345/main";
  };

  outputs = { nix-jmu-cs345, ... }@inputs: {
    nixosConfigurations = {
      <your-hostname> = nixpkgs.lib.nixosSystem {
        # ...
        modules = [
          nix-jmu-cs345.nixosModules.bernstdh
        ];
      };
    };
  };
}
```
For use in home-manager, import `nix-jmu-cs345.homeManagerModules.bernstdh` in your `home.nix` instead.

Then, in your configuration, enable the environment.
```nix
programs.nix-jmu-cs345.enable = true;
```

## Details
The developemnt environment is configured to include the following in accordance with the [CS345 Java Development Environment](https://w3.cs.jmu.edu/bernstdh/web/common/help/java-development-environment_setup.php). Note that currently the checkstyle and formatter configs will still have to be manually downloaded and configured within Eclipse.
- OpenJDK v21
- Eclipse IDE for Java Developers 2024-06 R
- Checkstyle plugin for Eclipse v10.17
- JUnit plugin for Eclipse v5.10
- EclEmma plugin for Eclipse v3.1.9
