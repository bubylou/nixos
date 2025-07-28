{ config, lib, modulesPath, pkgs, ... }:

{
  programs.zsh.enable = true;
  time.timeZone = "America/New_York";

  users.users.buby = {
    isNormalUser = true;
    description = "Nicholas Malcolm";
    extraGroups = [ "networkmanager" "podman" "wheel" ];
    packages = with pkgs; [
      neovim
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMLpbx2wvIh7+iksunMRtHh9qDfwojF4j/ObtH+IdxMD buby@stealtha16"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHhoQaZW/NXiN5504yj83XwTB+lzgwmvKnMq2LMQyYh9 buby@xps13-9370"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkQE5CNg1fJlcd38/teACJuLSK4w17CpDzICsfJUGuSBtZx0IFnV6LA5E5dmA12e95u7G5Zq/mTVDY2z3bZ/TvuOcvgkDBmX4z9tZ5PAhSTgq9xHguMnHM5fYZcwqbPP7Uk3BXLCUIL2NYrBomM+OmZvrPXM/s/QUVRdU4lLCkYfQLJE3O+KF1YxDhZHglz5S1mmfx0lzOIdJwnpQ4gWaWkZ3k/4OdRy2IGssbewb8F/XJbI8IQU7g3cai+SrCu3X1Gv8c1RNFfaVbPvEnFI7XftjyRq0w3ltbM582TOubanhHUrGhoDIr0w5FcxG8213RuWnmGpNrIGtJXUAzfswN4PImGFWlzR4T9Otsxg233xdZAGfeU+JTNJQjveOZy9FrHVbace8+b+PQOTGM8DIS8nmNxIiMFYNwtFljAA/SXPF++LBpT4X5Je1MjOyXaKEEjlRMfO09yFTjl7y9clXLpb8TZiixgU8OMa1p+QOT4f/uiupNDJ18VUD/+UfaoCoifEjsTcj8cTO3tdV0+X0v11d/wJ68poECoyyZyvnj9EfC8RBHefWhFDjGCXP2uSOiQs9xkgtgqJTA8qQgToHeOXYEGX45Wg+yXRArvxsltgW1FJxFbzuVFMRStRWP1iKx7E0gWdmY98BL8cniLPxG7RHln0DOCeEh0bej6ePuTQ== cardno:24 703 998"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdPY1Vc4MOh4/YD1B0/wIrFt1GUhCoO7YdOA+ETwLg5cDrzvrGlwGTC1X1bJ5Qw2YleP1aQj0VCZ5UoECr1iwKtU+jcHWBKyahJj2I2/3Puedg+RZdWhmoRxhxOP+hwzXWtmRNHBkEFTZqIRduIwGvRPjIV/+vKHF6UT7wwDsLIveC+8dZewq03TG4O0/EQNCGT7uQ4oNj8th3ublgopbiMFMw/NkgL1qIGyRykIC4GrUjB8MYXaPizV04s3MbEHP3T/Pcc76YzPnzV+3b2W3dzrQa9fQ/9lPcfrioZwcjgi9xdW1UCDH0TTINM5zgbOM/ygZI5pTWuSlyCQ7LVhMDjYl5El0/TAhMLSOxPloEwvNPa8as9mcN3V5R8+y9QTLXM7eiNlSEezOZTElTcE6Zh3/akI+AS8NuULsF4Kdst3RGwJ1ITuNYF9+GQHdbZ2t2GTbh3R7Gjtq7ICTc1xdUCLR7exS2EIdwU6K13zoXSkWnmKBtBxRm+rltKxzKbvoj0Qa4+QS+ZoNtxTGAmX0A/KwN3M7NurclH0B7mQp2AlFuXO7qyX/kRgnzl/Wzeg2H5NkgxfEzcL+qQVB+rmSv+DksHYy9mGdmtjsTStJu4hy8n1RhFb0aweZ7awU5dNBdnEE/PyBVoQx4YNON7oSoblozr6nqcvJtnWRjHJ7SYQ== cardno:22 664 363"
    ];
  };
}
