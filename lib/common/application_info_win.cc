#include "common/application_info.h"

#include "base/file_version_info.h"
#include "base/memory/scoped_ptr.h"
#include "base/strings/utf_string_conversions.h"

namespace gallium {

std::string GetApplicationName() {
  auto module = GetModuleHandle(nullptr);
  auto info = make_scoped_ptr(
      FileVersionInfo::CreateFileVersionInfoForModule(module));
  return base::UTF16ToUTF8(info->product_name());
}

std::string GetApplicationVersion() {
  auto module = GetModuleHandle(nullptr);
  auto info = make_scoped_ptr(
      FileVersionInfo::CreateFileVersionInfoForModule(module));
  return base::UTF16ToUTF8(info->product_version());
}

}  // namespace gallium
