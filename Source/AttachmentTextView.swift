//
//  AttachmentTextView.swift
//  AttachmentTextView
//
//  Created by LC on 2024/1/16.
//

import UIKit

open class AttachmentTextView: UITextView {

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private let attachmentBehavior = AttachmentTextViewBehavior()
    private var didBindBehavior = false

    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard superview != nil else { return }
        guard !didBindBehavior else { return }
        didBindBehavior = true
        bindBehavior()
    }

    private func bindBehavior() {
        self.attachmentBehavior.textView = self
        self.layoutManager.delegate = self.attachmentBehavior
        self.textStorage.delegate = self.attachmentBehavior
    }

    open override var textContainerInset: UIEdgeInsets {
        didSet {
            self.attachmentBehavior.layoutAttachedSubviews()
        }
    }

}
