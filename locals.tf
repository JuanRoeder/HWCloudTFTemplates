locals {
  enum_modules = {
    "computing" = {
      "ecs" = "./compting/ecs"
    }
  }
  
  enum_regions = {
    "LA-Santiago" = "la-south-2"
    "LA-Lima1" = "sa-peru-1"
    "LA-Mexico-City2" = "la-north-2"
    "LA-Sao-Paulo1" = "sa-brazil-1"
    "LA-Mexico-City1" = "na-mexico-1"
    "CN-South-Guangzhou" = "cn-south-1"
    "CN-North-Beijing4" = "cn-north-4"
    "CN East-Shanghai1" = "cn-east-3"
    "AP-Singapore" = "ap-southeast-3"
    "AP-Bangkok" = "ap-southeast-2"
    "CN-Hong-Kong" = "ap-southeast-1"
    "AF-Johannesburg" = "af-south-1"
  }

  enum_disk_type = {
    "Common-IO" = "SATA"
    "High-IO" = "SAS"
    "Ultra-high-IO" = "SSD"
    "General-purpose-SSD" = "GPSSD"
    "Extreme-SSD" = "ESSD"
    "General-purpose-SSD-V2" = "GPSSD2"
    "Extreme-SSD-V2" = "ESSD2"
  }

  enum_performance_type = {
    "General-Computing-basic" = "entry"
    "General-Computing-basic-T7" = "entry_smb"
    "General-Computing" = "normal"
    "General-Computing-X1" = "advanced_smb"
    "General-Computing-plus" = "computingv3"
    "General-Computing-plus-c6ne" = "computingv3_c6ne"
    "Memory-optimized" = "highmem"
    "Large-memory" = "saphana"
    "GPU-accelerated" = "gpu"
    "Ultra-high-IO" = "highio"
  }

  enum_image_type = {
    "ECS" = "FusionCompute"
    "BMS" = "Ironic"
    "Data" = "DataImage"
    "ISO" = "IsoImage"
  }

  enum_images = {

    "windows" = {
      "WS2019-Datacenter-EN" = "Windows Server 2019 Datacenter 64bit English"
      "WS2019-Datacenter-CN" = "Windows Server 2019 Datacenter 64bit"
      "WS2016-Datacenter-EN" = "Windows Server 2016 Datacenter 64bit English"
      "WS2016-Datacenter-CN" = "Windows Server 2016 Datacenter 64bit"
      "WS2016-Standard-EN" = "Windows Server 2016 Standard 64bit English"
      "WS2016-Standard-CN" = "Windows Server 2016 Standard 64bit"
      "WS2016-Standard-Pi2" = "Windows Server 2016 Standard 64bit for Pi2"
      "WS2012R2-Datacenter-EN" = "Windows Server 2012 R2 Datacenter 64bit English"
      "WS2012R2-Datacenter-CN" = "Windows Server 2012 R2 Datacenter 64bit"
      "WS2012R2-Standard-EN" = "Windows Server 2012 R2 Standard 64bit English"
      "WS2012SR2-Standard-CN" = "Windows Server 2012 R2 Standard 64bit"
    }

    "CentOS-BMS" = {
      "CentOS-7-9-sdi2" = "CentOS 7.9 x86 64bit sdi2 for BareMetal With Uniagent"
      "CentOS-7-9-sdi3" = "CentOS 7.9 x86 64bit sdi3 for BareMetal With Uniagent"
    }

    "CentOS" = {
      "CentOS-6-10" = "CentOS 6.10 64bit"
      "CentOS-7-2" = "CentOS 7.2 64bit"
      "CentOS-7-3" = "CentOS 7.3 64bit"
      "CentOS-7-4" = "CentOS 7.4 64bit"
      "CentOS-7-5" = "CentOS 7.5 64bit"
      "CentOS-7-5-Tesla-Cuda" = "CentOS 7.5 64bit with Tesla Driver 418.67 and Cuda 10.1"
      "CentOS-7-6" = "CentOS 7.6 64bit"
      "CentOS-7-7" = "CentOS 7.7 64bit"
      "CentOS-7-8" = "CentOS 7.8 64bit"
      "CentOS-7-8" = "CentOS 7.8 64bit"
      "CentOS-7-9" = "CentOS 7.9 64bit"
      "CentOS-8-0" = "CentOS 8.0 64bit"
      "CentOS-8-1" = "CentOS 8.1 64bit"
      "CentOS-8-2" = "CentOS 8.2 64bit"
      "CentOS-8-2-Tesla-Cuda" = "CentOS 8.2 64bit with Tesla Driver 460.73.01 and Cuda 11.2"
    }

    "Ubuntu-BMS" = {
      "Ubuntu-1804-sdi2" = "Ubuntu 1804 x86 server 64bit sdi2 for BareMetal With Uniagent"
    }

    "Ubuntu" ={
      "Ubuntu-16-04" = "Ubuntu 16.04 server 64bit"
      "Ubuntu-16-04-Tesla-Cuda" = "Ubuntu 16.04 server 64bit with Tesla Driver 418.67 and Cuda 10.1"
      "Ubuntu-18-04" = "Ubuntu 18.04 server 64bit"
      "Ubuntu-18-04-Tesla-Cuda" = "Ubuntu 18.04 server 64bit with Tesla Driver 460.73.01 and CUDA 11.2"
      "Ubuntu-20-04" = "Ubuntu 20.04 server 64bit"
      "Ubuntu-22-04" = "Ubuntu 22.04 server 64bit"
    }
  }
}