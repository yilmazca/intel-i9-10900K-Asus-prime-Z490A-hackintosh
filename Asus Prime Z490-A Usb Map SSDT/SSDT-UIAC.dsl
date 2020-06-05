DefinitionBlock ("", "SSDT", 2, "ACDT", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            // XHC (8086_06ed)
            "XHC", Package()
            {
                "port-count", Buffer() { 0x1A, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HS04", Package()
                      {
                          "name", Buffer() { "HS04" },
                          "UsbConnector", 9,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                      },
                      "HS07", Package()
                      {
                          "name", Buffer() { "HS07" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                      },
                      "HS08", Package()
                      {
                          "name", Buffer() { "HS08" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                      },
                      "HS09", Package()
                      {
                          "name", Buffer() { "HS09" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x09, 0x00, 0x00, 0x00 },
                      },
                      "HS10", Package()
                      {
                          "name", Buffer() { "HS10" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x0A, 0x00, 0x00, 0x00 },
                      },
                      "HS12", Package()
                      {
                          "name", Buffer() { "HS12" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x0C, 0x00, 0x00, 0x00 },
                      },
                      "HS13", Package()
                      {
                          "name", Buffer() { "HS13" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x0D, 0x00, 0x00, 0x00 },
                      },
                      "SS01", Package()
                      {
                          "name", Buffer() { "SS01" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x11, 0x00, 0x00, 0x00 },
                      },
                      "SS02", Package()
                      {
                          "name", Buffer() { "SS02" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x12, 0x00, 0x00, 0x00 },
                      },
                      "SS03", Package()
                      {
                          "name", Buffer() { "SS03" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x13, 0x00, 0x00, 0x00 },
                      },
                      "SS04", Package()
                      {
                          "name", Buffer() { "SS04" },
                          "UsbConnector", 9,
                          "port", Buffer() { 0x14, 0x00, 0x00, 0x00 },
                      },
                      "SS07", Package()
                      {
                          "name", Buffer() { "SS07" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x17, 0x00, 0x00, 0x00 },
                      },
                      "SS09", Package()
                      {
                          "name", Buffer() { "SS09" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x19, 0x00, 0x00, 0x00 },
                      },
                      "SS10", Package()
                      {
                          "name", Buffer() { "SS10" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x1A, 0x00, 0x00, 0x00 },
                      },
                },
            },
        })
    }
}
