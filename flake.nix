{
  description = "Development Environment for JMU's CS345";

  outputs = _: {
    nixosModules = {
      bernstdh = import ./modules;
    };
  };
}
