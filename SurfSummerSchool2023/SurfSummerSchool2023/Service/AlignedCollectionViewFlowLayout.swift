//
//  AlignedCollectionViewFlowLayout.swift
//  SurfSummerSchool2023
//
//  Created by Александра Тимонова on 01.08.2023.
//

import Foundation
import UIKit

class AlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        let attributes = super.layoutAttributesForElements(in: rect)

        let ltr = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        var leftMargin = ltr ? sectionInset.left : (rect.maxX - sectionInset.right)
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY
            {
                leftMargin = ltr ? sectionInset.left : (rect.maxX - sectionInset.right)
            }

            layoutAttribute.frame.origin.x = leftMargin - (ltr ? 0 : layoutAttribute.frame.width)

            if (ltr)
            {
                leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            }
            else
            {
                leftMargin -= layoutAttribute.frame.width + minimumInteritemSpacing
            }
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}
