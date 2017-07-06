#### Setting up UEFI enabled macOS

No support is provided for OVMF and Clover based installations at the moment.
Experiment at your own risk.

* Install macOS by following the usual Enoch method.

* Build and use QEMU from https://github.com/kholia/qemu/. Use the "macOS"
  branch. Clover + macOS will fail to boot without this step.

* Install the included `Clover_v2*.pkg` on the main macOS disk.

  * Hit the `Customize` button during Clover install.

  * Tick 'Install for UEFI booting only', OsxAptioFix2Drv-64 and
    PartitionDxe-64 options.

* The Clover installer should leave the EFI partition mounted for us. Open that
  up in Finder.

  * Replace the `EFI/CLOVER/config.plist` file with `config.plist` included in
    this folder.

  * Put the included `q35-acpi-dsdt.aml` file into `EFI/CLOVER/ACPI/origin`
    location.

  * Edit `EFI/CLOVER/config.plist` to change the screen resolution from
    `800x600` to a higher value (e.g. 1024x768).

* Finally, use `boot-clover.sh` to use OVMF/UEFI to boot macOS with Clover.

* You can use `Clover Configurator` to modify your Clover configuration, if
  required.

#### Credits

* Nicholas Sherlock and others - UEFI, Clover, and other hacks

* Kyle Dayton - UEFI, Clover, and GPU passthrough notes
