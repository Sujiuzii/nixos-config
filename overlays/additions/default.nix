{ ... }:
final: _prev:
{
  polybar-config = final.callPackage ../../packages/polybar-config { };
  sddm-rose-pine = final.callPackage ../../packages/sddm-rose-pine { };
}
