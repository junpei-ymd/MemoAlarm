//
//  EditAlarmViewModel.swift
//  MemoAlarm
//
//  Created by 山田純平 on 2022/02/14.
//

import Foundation
import RxSwift
import RxCocoa

protocol EditAlarmViewModelInputs: AnyObject {
    var inputAlarm: PublishRelay<Alarm> { get }
    var ready: PublishRelay<Void> { get }
}

protocol EditAlarmViewModelOutputs: AnyObject {
    var editingAlarm: Driver<Alarm> { get }
}

protocol EditAlarmViewModelType: AnyObject {
    var inputs: EditAlarmViewModelInputs { get }
    var outputs: EditAlarmViewModelOutputs { get }
}

final class EditAlarmViewModel: EditAlarmViewModelType, EditAlarmViewModelInputs, EditAlarmViewModelOutputs {
    var inputs: EditAlarmViewModelInputs { return self }
    var outputs: EditAlarmViewModelOutputs { return self }
    
    // MARK: - Input
    var inputAlarm = PublishRelay<Alarm>()
    var ready = PublishRelay<Void>()
    
    //MARK: - Output
    var editingAlarm: Driver<Alarm>
    
    
    private let disposeBag = DisposeBag()
    
    init(alarm: Alarm, outputAlarm: PublishRelay<Alarm>) {
        
        editingAlarm = ready
            .map({ alarm })
            .asDriver(onErrorJustReturn: Alarm(name: "", note: "", ringTime: DateComponents(), isRepeated: false, isRingable: false))
        inputAlarm
            .subscribe(onNext:{ alarm in
                
            })
            .disposed(by: disposeBag)
    }
    
    
}