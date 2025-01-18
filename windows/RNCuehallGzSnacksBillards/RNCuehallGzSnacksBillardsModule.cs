using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Cuehall.Gz.Snacks.Billards.RNCuehallGzSnacksBillards
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNCuehallGzSnacksBillardsModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNCuehallGzSnacksBillardsModule"/>.
        /// </summary>
        internal RNCuehallGzSnacksBillardsModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNCuehallGzSnacksBillards";
            }
        }
    }
}
