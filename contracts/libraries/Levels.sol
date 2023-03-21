// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

library Levels {
    enum Level {
        DUST,
        GEM,
        CRYSTAL,
        LIGHTNING
    }

    function getLevelByDustAmount(uint256 dust) internal pure returns (Level) {
        if (dust < 10) {
            return Level.DUST;
        }

        if (dust < 100) {
            return Level.GEM;
        }

        if (dust < 1000) {
            return Level.CRYSTAL;
        }

        return Level.LIGHTNING;
    }

    function _getDustPercentage(Level level, uint256 months)
        internal
        pure
        returns (uint256 dustPercentage)
    {
        if (level == Level.DUST) {
            if (months >= 12) {
                return 100;
            }
            if (months >= 6) {
                return 60;
            }
            if (months >= 3) {
                return 30;
            }
            if (months >= 1) {
                return 10;
            }

            return 0;
        }

        if (level == Level.GEM) {
            if (months >= 10) {
                return 100;
            }
            if (months >= 6) {
                return 60;
            }
            if (months >= 3) {
                return 40;
            }
            if (months >= 1) {
                return 20;
            }

            return 0;
        }

        if (level == Level.CRYSTAL) {
            if (months >= 8) {
                return 100;
            }
            if (months >= 6) {
                return 70;
            }
            if (months >= 3) {
                return 50;
            }
            if (months >= 1) {
                return 30;
            }

            return 0;
        }

        if (months >= 6) {
            return 100;
        }
        if (months >= 5) {
            return 80;
        }
        if (months >= 3) {
            return 60;
        }
        if (months >= 1) {
            return 40;
        }

        return 0;
    }
}
