{ }:

with import <nixpkgs> {};

let
  python = python26;
  pythonPackages = python26Packages;
  base = import ./base.nix {
    inherit python pythonPackages;
  };
in
buildEnv {
  name = "dev-env";
  ignoreCollisions = true;
  paths = [
    (openldap.override { cyrus_sasl = null; openssl = null; })
    pythonPackages.ldap
    pythonPackages.zope_interface
  ] ++ base.paths;
}
