// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Copyright (c) 2013 Adam Roben <adam@roben.org>. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE-CHROMIUM file.

#import "main_delegate.h"

#include "common/application_info.h"
#include "common/mac/foundation_util.h"
#include "common/mac/main_application_bundle.h"

#include "base/command_line.h"
#include "base/mac/bundle_locations.h"
#include "base/path_service.h"
#include "base/strings/stringprintf.h"
#include "base/strings/sys_string_conversions.h"
#include "content/public/common/content_paths.h"
#include "content/public/common/content_switches.h"

namespace gallium {

namespace {

// base::FilePath GetFrameworksPath() {
//   return MainApplicationBundlePath().Append("Contents").Append("Frameworks");
// }

}

base::FilePath MainDelegate::GetResourcesPakFilePath() {
  auto path = [base::mac::FrameworkBundle() pathForResource:@"content_shell" ofType:@"pak"];
  return base::mac::NSStringToFilePath(path);
}

void MainDelegate::OverrideFrameworkBundlePath() {
  base::mac::SetOverrideFrameworkBundlePath(
    base::FilePath("/Users/alex/Code/gallium/lib/build/Debug/Gallium.framework"));

  //base::FilePath helper_path = GetFrameworksPath().Append("Gallium.framework");
  //base::mac::SetOverrideFrameworkBundlePath(helper_path);
}

}
