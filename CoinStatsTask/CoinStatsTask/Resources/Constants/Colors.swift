//
//  Colors.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import UIKit

enum Colors {
    static var rankBackground: UIColor { return .lightGray }

    static var backGround: UIColor {
        UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .light ? .white : .black
        }
    }

    static var title: UIColor {
        UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .light ? .black : .gray
        }
    }

    static var negativeRed: UIColor {
        UIColor { traitCollection in
            let light  = UIColor(red: 223/255, green: 62/255, blue: 62/255, alpha: 1)
            let dark  = UIColor(red: 238/255, green: 89/255, blue: 84/255, alpha: 1)

            return traitCollection.userInterfaceStyle == .light ? light : dark
        }
    }

    static var positiveGreen: UIColor {
        UIColor { traitCollection in
            let light  = UIColor(red: 91/255, green: 175/255, blue: 86/255, alpha: 1)
            let dark  = UIColor(red: 132/255, green: 203/255, blue: 104/255, alpha: 1)

            return traitCollection.userInterfaceStyle == .light ? light : dark
        }
    }

    static var neitralGray: UIColor {
        UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .light ? .lightGray : .gray
        }
    }
}
